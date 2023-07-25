
<!-- README.md is generated from README.Rmd. Please edit that file -->

# gpsTurns

<!-- badges: start -->
<!-- badges: end -->

The goal of gpsTurns is to …

## Installation

You can install the development version of gpsTurns from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("gbasulto/gpsTurns")
```

## Functions

## Trace Summaries

Calculate longest sequence of consecutive NAs, and the number of such
sequences.

``` r

library(gpsTurns)

## Max = 3
## NA sequences: 4
x <- c(1, NA, 2, NA, NA, 3, 4, NA, NA, NA, 5, 6, 7, NA)
calculate_longest_na_seq(x)
#> [1] 3
calculate_number_of_na_seqs(x)
#> [1] 4
```

### Auxiliary Functions

- `cros_prod_sign`: Cross product sign to indicate left of right turn.
- `angle_diff`: Difference in angles (0 to 180) to compute change in
  heading.

``` r

library(gpsTurns)


## Cross product signs
cities <-
  tibble::tribble(
    ~city, ~latitude, ~longitude,
    "Las Vegas", 36.1699, -115.1398,
    "San Diego", 32.7157, -117.1611,
    "Los Angeles", 34.0522, -118.2437,
    "San Francisco", 37.7749, -122.4194,
    "Portland", 45.5122, -122.6587,
    "Seattle", 47.6062, -122.3321,
    "Vancouver", 49.2827, -123.1207,
    "Anchorage", 61.2181, -149.9003
  )

with(cities, cross_prod_sign(latitude, longitude))
#> [1] NA -1  1 -1 -1  1  1 NA


## Must return NA, 45, 45, 45
angle_diff(c(330, 15, 60, 15))
#> [1] NA 45 45 45
```
