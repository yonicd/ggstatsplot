Tests and Coverage
================
07 October, 2018 11:54:24

This output is created by
[covrpage](https://github.com/yonicd/covrpage).

## Coverage

Coverage summary is created using the
[covr](https://github.com/r-lib/covr)
package.

| Object                                                                            | Coverage (%) |
| :-------------------------------------------------------------------------------- | :----------: |
| ggstatsplot 🔴                                                                     |    20.32     |
| [R/combine\_plots.R](../R/combine_plots.R)                                        |     0.00     |
| [R/ggcoefstats.R](../R/ggcoefstats.R)                                             |     0.00     |
| [R/ggcorrmat.R](../R/ggcorrmat.R)                                                 |     0.00     |
| [R/gghistostats.R](../R/gghistostats.R)                                           |     0.00     |
| [R/ggpiestats.R](../R/ggpiestats.R)                                               |     0.00     |
| [R/grouped\_ggbetweenstats.R](../R/grouped_ggbetweenstats.R)                      |     0.00     |
| [R/grouped\_ggcorrmat.R](../R/grouped_ggcorrmat.R)                                |     0.00     |
| [R/grouped\_gghistostats.R](../R/grouped_gghistostats.R)                          |     0.00     |
| [R/grouped\_ggpiestats.R](../R/grouped_ggpiestats.R)                              |     0.00     |
| [R/helpers\_ggcoefstats.R](../R/helpers_ggcoefstats.R)                            |     0.00     |
| [R/helpers\_ggcorrmat.R](../R/helpers_ggcorrmat.R)                                |     0.00     |
| [R/helpers\_gghistostats\_subtitles.R](../R/helpers_gghistostats_subtitles.R)     |     0.00     |
| [R/helpers\_ggpiestats\_subtitles.R](../R/helpers_ggpiestats_subtitles.R)         |     0.00     |
| [R/helpers\_messages.R](../R/helpers_messages.R)                                  |     0.00     |
| [R/helpers\_stats.R](../R/helpers_stats.R)                                        |     0.00     |
| [R/helpers\_ggbetween\_subtitles.R](../R/helpers_ggbetween_subtitles.R)           |    23.17     |
| [R/theme\_ggstatsplot.R](../R/theme_ggstatsplot.R)                                |    29.27     |
| [R/helpers\_ggscatterstats\_subtitles.R](../R/helpers_ggscatterstats_subtitles.R) |    30.77     |
| [R/ggbetweenstats.R](../R/ggbetweenstats.R)                                       |    41.34     |
| [R/grouped\_ggscatterstats.R](../R/grouped_ggscatterstats.R)                      |    45.54     |
| [R/ggscatterstats.R](../R/ggscatterstats.R)                                       |    53.56     |
| [R/helpers\_effsize\_ci.R](../R/helpers_effsize_ci.R)                             |    80.78     |
| [R/specify\_decimal\_p.R](../R/specify_decimal_p.R)                               |    100.00    |

    ## 🔴 Tests Failed
    ##   Coverage statistics are approximations of the non-failing tests.
    ##   Use with caution

<br>

## Unit Tests

Unit Test summary is created using the
[testthat](https://github.com/r-lib/testthat)
package.

|                                 | file                                                                      |  n |  time | error | failed | skipped | warning |
| ------------------------------- | :------------------------------------------------------------------------ | -: | ----: | ----: | -----: | ------: | ------: |
| test\_anova\_subtitles.R        | [test\_anova\_subtitles.R](testthat/test_anova_subtitles.R)               |  4 | 0.973 |     0 |      0 |       0 |       0 |
| test\_chisq\_v\_ci.R            | [test\_chisq\_v\_ci.R](testthat/test_chisq_v_ci.R)                        | 10 | 0.010 |     0 |      0 |       0 |       0 |
| test\_cor\_tets\_ci.R           | [test\_cor\_tets\_ci.R](testthat/test_cor_tets_ci.R)                      | 12 | 0.013 |     0 |      0 |       0 |       0 |
| test\_ggbetweenstats.R          | [test\_ggbetweenstats.R](testthat/test_ggbetweenstats.R)                  |  1 | 1.318 |     0 |      0 |       1 |       0 |
| test\_grouped\_ggscatterstats.R | [test\_grouped\_ggscatterstats.R](testthat/test_grouped_ggscatterstats.R) |  1 | 0.129 |     0 |      0 |       0 |       0 |
| test\_helpers\_effsize\_ci.R    | [test\_helpers\_effsize\_ci.R](testthat/test_helpers_effsize_ci.R)        |  5 | 0.006 |     0 |      0 |       0 |       0 |
| test\_lm\_effsize\_ci.R         | [test\_lm\_effsize\_ci.R](testthat/test_lm_effsize_ci.R)                  |  9 | 0.010 |     0 |      2 |       0 |       0 |
| test\_robcor\_ci.R              | [test\_robcor\_ci.R](testthat/test_robcor_ci.R)                           |  8 | 0.008 |     0 |      0 |       0 |       0 |
| test\_specify\_decimal\_p.R     | [test\_specify\_decimal\_p.R](testthat/test_specify_decimal_p.R)          |  3 | 0.002 |     0 |      0 |       0 |       0 |
| test\_t\_test\_subtitles.R      | [test\_t\_test\_subtitles.R](testthat/test_t_test_subtitles.R)            |  1 | 0.632 |     0 |      0 |       0 |       0 |

<details open>

<summary> Show Detailed Test Results
</summary>

| file                                                                             | context                 | test                          | status  |  n |  time |
| :------------------------------------------------------------------------------- | :---------------------- | :---------------------------- | :------ | -: | ----: |
| [test\_anova\_subtitles.R](testthat/test_anova_subtitles.R#L30_L33)              | anova\_subtitles        | anova subtitles work          | PASS    |  4 | 0.973 |
| [test\_chisq\_v\_ci.R](testthat/test_chisq_v_ci.R#L36)                           | chisq\_v\_ci            | chisq\_v\_ci works            | PASS    | 10 | 0.010 |
| [test\_cor\_tets\_ci.R](testthat/test_cor_tets_ci.R#L36)                         | cor\_tets\_ci           | cor\_tets\_ci works           | PASS    | 12 | 0.013 |
| [test\_ggbetweenstats.R](testthat/test_ggbetweenstats.R#L17_L20)                 | ggbetweenstats          | ggbetweenstats works          | SKIPPED |  1 | 1.318 |
| [test\_grouped\_ggscatterstats.R](testthat/test_grouped_ggscatterstats.R#L7_L15) | grouped\_ggscatterstats | grouped\_ggscatterstats works | PASS    |  1 | 0.129 |
| [test\_helpers\_effsize\_ci.R](testthat/test_helpers_effsize_ci.R#L54)           | helpers\_effsize\_ci    | ci stuff works                | PASS    |  5 | 0.006 |
| [test\_lm\_effsize\_ci.R](testthat/test_lm_effsize_ci.R#L54)                     | lm\_effsize\_ci         | lm\_effsize\_ci works         | FAILED  |  9 | 0.010 |
| [test\_robcor\_ci.R](testthat/test_robcor_ci.R#L32)                              | robcor\_ci              | robcor\_ci works              | PASS    |  8 | 0.008 |
| [test\_specify\_decimal\_p.R](testthat/test_specify_decimal_p.R#L11)             | Specify decimals        | specify\_decimal\_p works     | PASS    |  3 | 0.002 |
| [test\_t\_test\_subtitles.R](testthat/test_t_test_subtitles.R#L38_L42)           | t\_test\_subtitles      | t-test subtitles work         | PASS    |  1 | 0.632 |

</details>

<details>

<summary> Session Info </summary>

| Field    | Value                               |
| :------- | :---------------------------------- |
| Version  | R version 3.5.1 (2018-07-02)        |
| Platform | x86\_64-apple-darwin15.6.0 (64-bit) |
| Running  | macOS High Sierra 10.13.6           |
| Language | en\_US                              |
| Timezone | America/New\_York                   |

| Package  | Version    |
| :------- | :--------- |
| testthat | 2.0.0.9000 |
| covr     | 3.2.0      |
| covrpage | 0.0.60     |

</details>

<!--- Final Status : error/failed --->
