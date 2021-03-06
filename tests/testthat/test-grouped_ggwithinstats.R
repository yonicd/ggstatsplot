# outlier labeling works --------------------------------------------------

testthat::test_that(
  desc = "grouping.var works across vector types",
  code = {
    testthat::skip_on_cran()
    set.seed(123)

    # expect error when no grouping.var is specified
    testthat::expect_error(
      ggstatsplot::grouped_ggwithinstats(
        VR_dilemma,
        x = modality,
        y = score
      )
    )

    # outlier tagging is not required
    testthat::expect_is(
      ggstatsplot::grouped_ggwithinstats(
        VR_dilemma,
        x = modality,
        y = score,
        grouping.var = order,
        results.subtitle = FALSE,
        outlier.tagging = FALSE,
        type = "bayes",
        messages = FALSE
      ),
      "ggplot"
    )

    # `outlier.label` is not specified
    set.seed(123)
    testthat::expect_true(inherits(
      ggstatsplot::grouped_ggwithinstats(
        VR_dilemma,
        x = modality,
        y = score,
        grouping.var = order,
        type = "p",
        output = "plot",
        bf.message = TRUE,
        results.subtitle = FALSE,
        outlier.tagging = TRUE,
        pairwise.comparisons = TRUE,
        pairwise.annotation = "p.score",
        messages = FALSE
      ),
      what = "gg"
    ))

    # `outlier.label` is character
    # also x, y, and outlier.label arguments as characters
    set.seed(123)
    dat <- iris_long
    dat$id <- as.character(dat$id)

    testthat::expect_true(inherits(
      ggstatsplot::grouped_ggwithinstats(
        data = dat,
        x = "attribute",
        y = "value",
        grouping.var = Species,
        messages = FALSE,
        type = "r",
        results.subtitle = FALSE,
        pairwise.comparisons = TRUE,
        outlier.tagging = TRUE,
        outlier.label = "id",
        outlier.coef = 2
      ),
      what = "gg"
    ))
  }
)

# subtitle output with NA --------------------------------------------------

testthat::test_that(
  desc = "subtitle output with NA",
  code = {
    testthat::skip_on_cran()

    # data
    df <- ggstatsplot::bugs_long %>%
      dplyr::filter(., region %in% c("North America"))

    # should output a list of length 2
    set.seed(123)
    ls_results <-
      ggstatsplot::grouped_ggwithinstats(
        data = df,
        x = condition,
        y = desire,
        grouping.var = region,
        output = "subtitle",
        messages = FALSE,
        bf.message = FALSE
      )

    set.seed(123)
    basic_results <-
      ggstatsplot::ggwithinstats(
        data = df,
        x = condition,
        y = desire,
        output = "subtitle",
        messages = FALSE,
        bf.message = FALSE
      )

    # tests
    testthat::expect_equal(length(ls_results), 1L)
    testthat::expect_identical(ls_results$`North America`, basic_results)
  }
)
