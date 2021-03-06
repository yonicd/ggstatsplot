#' @title Grouped histograms for distribution of a numeric variable
#' @name grouped_gghistostats
#' @description Helper function for `ggstatsplot::gghistostats` to apply this
#'   function across multiple levels of a given factor and combining the
#'   resulting plots using `ggstatsplot::combine_plots`.
#'
#' @inheritParams gghistostats
#' @inheritParams grouped_ggbetweenstats
#' @inheritDotParams gghistostats -title
#'
#' @importFrom dplyr select bind_rows
#' @importFrom rlang !! enquo quo_name ensym
#' @importFrom purrr pmap
#' @importFrom tidyr drop_na
#'
#' @seealso \code{\link{gghistostats}}, \code{\link{ggdotplotstats}},
#'  \code{\link{grouped_ggdotplotstats}}
#'
#' @inherit gghistostats return references
#' @inherit gghistostats return details
#'
#' @examples
#' \donttest{
#' # for reproducibility
#' set.seed(123)
#'
#' # plot
#' ggstatsplot::grouped_gghistostats(
#'   data = iris,
#'   x = Sepal.Length,
#'   test.value = 5,
#'   grouping.var = Species,
#'   bar.fill = "orange",
#'   ggplot.component = list(
#'     ggplot2::scale_x_continuous(breaks = seq(3, 9, 1), limits = (c(3, 9))),
#'     ggplot2::scale_y_continuous(breaks = seq(0, 25, 5), limits = (c(0, 25)))
#'   ),
#'   messages = FALSE,
#'   plotgrid.args = list(nrow = 1, labels = c("(i)", "(ii)", "(iii)")),
#' )
#' }
#' @export
#'

# defining the function
grouped_gghistostats <- function(data,
                                 x,
                                 grouping.var,
                                 binwidth = NULL,
                                 title.prefix = NULL,
                                 output = "plot",
                                 ...,
                                 plotgrid.args = list(),
                                 title.text = NULL,
                                 title.args = list(size = 16, fontface = "bold"),
                                 caption.text = NULL,
                                 caption.args = list(size = 10),
                                 sub.text = NULL,
                                 sub.args = list(size = 12)) {

  # ======================== computing binwidth ============================

  # ensure the grouping variable works quoted or unquoted
  grouping.var <- rlang::ensym(grouping.var)

  # if `title.prefix` is not provided, use the variable `grouping.var` name
  if (is.null(title.prefix)) title.prefix <- rlang::as_name(grouping.var)

  # maximum value for x
  binmax <-
    dplyr::select(.data = data, {{ x }}) %>%
    max(x = ., na.rm = TRUE)

  # minimum value for x
  binmin <-
    dplyr::select(.data = data, {{ x }}) %>%
    min(x = ., na.rm = TRUE)

  # number of datapoints
  bincount <- as.integer(data %>% dplyr::count(.))

  # adding some binwidth sanity checking
  if (is.null(binwidth)) {
    binwidth <- (binmax - binmin) / sqrt(bincount)
  }

  # ======================== preparing dataframe ============================

  # getting the dataframe ready
  df <-
    dplyr::select(.data = data, {{ grouping.var }}, {{ x }}) %>%
    grouped_list(data = ., grouping.var = {{ grouping.var }})

  # creating a list of plots
  plotlist_purrr <-
    purrr::pmap(
      .l = list(data = df, title = paste(title.prefix, ": ", names(df), sep = "")),
      .f = ggstatsplot::gghistostats,
      # put common parameters here
      x = {{ x }},
      binwidth = binwidth,
      output = output,
      ...
    )

  # combining the list of plots into a single plot
  if (output == "plot") {
    return(ggstatsplot::combine_plots2(
      plotlist = plotlist_purrr,
      plotgrid.args = plotgrid.args,
      title.text = title.text,
      title.args = title.args,
      caption.text = caption.text,
      caption.args = caption.args,
      sub.text = sub.text,
      sub.args = sub.args
    ))
  } else {
    return(plotlist_purrr) # subtitle list
  }
}
