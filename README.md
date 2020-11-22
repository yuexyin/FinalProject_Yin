
<!-- README.md is generated from README.Rmd. Please edit that file -->

# FinalProjectYin

<!-- badges: start -->

<!-- badges: end -->

The goal of FinalProjectYin is to make the data analysis of
electrophysiology data from an experiment in my lab easier and faster.

## Installation

You can install the released version of FinalProjectYin from
[CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("FinalProjectYin")
```

And the development version from [GitHub](https://github.com/)
with:<https://github.com/yuexyin/FinalProject_Yin>

``` r
# install.packages("devtools")
devtools::install_github("yuexyin/FinalProject_Yin")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
ephys <- read.csv("Ephys_Yin.csv", header = TRUE)
```

``` r
head(ephys1 <- ephysfilter(ephys))
#>   Cell.ID Animal.ID Treatment y.frac z.plane Start.Resistance End.Resistance
#> 1  yy0047    817145   alcohol  0.565      42               19             19
#> 2  yy0049    817150     water  0.448      45               24             24
#> 3  yy0050    817150     water  0.463      45               15             14
#> 4  yy0051    817150     water  0.434      45               13             13
#> 5  yy0052    817150     water  0.507      43               20             23
#> 6  yy0053    817150     water  0.500      43               20             21
#>   Resistance.difference Voltage.threshold.mV Current.Threshold..pA.
#> 1            0.00000000             -42.1602                    100
#> 2            0.00000000             -38.6890                    100
#> 3            0.06666667             -37.2443                    100
#> 4            0.00000000             -33.9185                    250
#> 5            0.15000000             -32.0884                    100
#> 6            0.05000000             -35.3299                    100
```

``` r
StatsTable(ephys1, "alcohol", "water", "Cell.ID", "Voltage.threshold.mV")
#>                  Mean      STD
#> Group1stats -43.04866 4.489839
#> Group2stats -37.76110 3.986581
```

``` r
threshttest("Voltage.threshold.mV", ephys1)
#> [1] 0.01275359
```

What is special about using `README.Rmd` instead of just `README.md`?
You can include R chunks like so:

You’ll still need to render `README.Rmd` regularly, to keep `README.md`
up-to-date.

You can also embed plots, for example:

In that case, don’t forget to commit and push the resulting figure
files, so they display on GitHub\!
