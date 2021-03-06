#' @title Create labels with statistical details for `ggcoefstats`
#' @name ggcoefstats_label_maker
#'
#' @param ... Currently ignored.
#' @param tidy_df A tidy dataframe.
#' @param ... Currently ignored.
#' @inheritParams ggcoefstats
#'
#' @importFrom dplyr mutate rowwise
#'
#' @keywords internal

# function body
ggcoefstats_label_maker <- function(tidy_df,
                                    statistic = NULL,
                                    k = 2L,
                                    effsize = "eta",
                                    partial = TRUE,
                                    ...) {

  #----------------------- p-value cleanup ------------------------------------

  # formatting the p-values
  tidy_df %<>%
    signif_column(data = ., p = p.value) %>%
    ipmisc::p_value_formatter(data = ., k = k)

  #--------------------------- t-statistic ------------------------------------

  # if the statistic is t-value
  if (statistic == "t") {
    # check if df info is available somewhere
    if ("df.error" %in% names(tidy_df)) {
      # adding a new column with residual `df`
      tidy_df %<>%
        dplyr::rowwise() %>%
        dplyr::mutate(
          label = paste(
            "list(~widehat(italic(beta))==",
            specify_decimal_p(x = estimate, k = k),
            ", ~italic(t)",
            "(",
            specify_decimal_p(x = df.error, k = 0L),
            ")==",
            specify_decimal_p(x = statistic, k = k),
            ", ~italic(p)",
            p.value.formatted,
            ")",
            sep = ""
          )
        )
    } else {
      # for objects like `rlm` there will be no parameter
      tidy_df %<>%
        dplyr::rowwise() %>%
        dplyr::mutate(
          label = paste(
            "list(~widehat(italic(beta))==",
            specify_decimal_p(x = estimate, k = k),
            ", ~italic(t)",
            "==",
            specify_decimal_p(x = statistic, k = k),
            ", ~italic(p)",
            p.value.formatted,
            ")",
            sep = ""
          )
        )
    }
  }

  #--------------------------- z-statistic ---------------------------------

  # if the statistic is z-value
  if (statistic == "z") {
    tidy_df %<>%
      dplyr::rowwise() %>%
      dplyr::mutate(
        label = paste(
          "list(~widehat(italic(beta))==",
          specify_decimal_p(x = estimate, k = k),
          ", ~italic(z)==",
          specify_decimal_p(x = statistic, k = k),
          ", ~italic(p)",
          p.value.formatted,
          ")",
          sep = ""
        )
      )
  }

  #--------------------------- f-statistic ---------------------------------

  if (statistic == "f") {
    # which effect size is needed?
    if (effsize == "eta") {
      if (isTRUE(partial)) {
        effsize.text <- list(quote(widehat(italic(eta)[p]^2)))
      } else {
        effsize.text <- list(quote(widehat(italic(eta)^2)))
      }
    }

    if (effsize == "omega") {
      if (isTRUE(partial)) {
        effsize.text <- list(quote(widehat(italic(omega)[p]^2)))
      } else {
        effsize.text <- list(quote(widehat(italic(omega)^2)))
      }
    }

    # which effect size is needed?
    tidy_df %<>%
      dplyr::rowwise() %>%
      dplyr::mutate(
        label = paste(
          "list(~italic(F)",
          "(",
          df1,
          "*\",\"*",
          df2,
          ")==",
          specify_decimal_p(x = statistic, k = k),
          ", ~italic(p)",
          p.value.formatted,
          ", ~",
          effsize.text,
          "==",
          specify_decimal_p(x = estimate, k = k),
          ")",
          sep = ""
        )
      )
  }

  # return the final dataframe
  return(dplyr::ungroup(tidy_df))
}


#' @name extract_statistic
#'
#' @importFrom insight find_statistic
#' @importFrom purrr pmap keep
#'
#' @noRd

extract_statistic <- function(x, ...) {
  # if not a dataframe, figure out what's the relevant statistic
  statistic <- insight::find_statistic(x)

  # standardize statistic type symbol for regression models
  # checking entered strings to extract the statistic
  grep_stat <- function(x, pattern) {
    if (isTRUE(grepl(pattern, x, ignore.case = TRUE))) {
      return(tolower(substring(x, 1, 1)))
    } else {
      return(NA_character_)
    }
  }

  # extracting statistic value
  purrr::pmap(
    .l =
      list(
        pattern = list("^t", "^f", "^z", "^chi"),
        x = list(statistic)
      ),
    .f = grep_stat
  ) %>%
    purrr::keep(.x = ., .p = ~ !is.na(.)) %>%
    .[[1]]
}
