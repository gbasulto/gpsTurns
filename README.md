
<!-- README.md is generated from README.Rmd. Please edit that file -->

# gpsTurns

<!-- badges: start -->
<!-- badges: end -->

The aim of `gpsTurns` is to count the number of left and right turns
using a given set of GPS coordinates. Additionally, it provides tools
for analyzing the execution of these turns.

## Installation

You can install the development version of gpsTurns from
[GitHub](https://github.com/) with the following:

``` r
# install.packages("devtools")
devtools::install_github("gbasulto/gpsTurns")
```

## Functions

## Trace Summaries

Calculate the longest sequence of consecutive NAs and the number of such
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

- `cros_prod_sign`: Cross product sign to indicate left or right turn.
- `angle_diff`: Difference in angles (0 to 180) to compute the change in
  heading.
- `compute_gps_heading`: Heading based on GPS coordinates. No smoothing
  is performed.
- `classify_turns`: Determine whether a direction change classifies as a
  left or right turn.

``` r

library(gpsTurns)

## Sample dataset
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

## Cross product signs
## __________________________________________________
## Must return vector of 1 and -1
with(cities, cross_prod_sign(latitude, longitude))
#> [1] NA -1  1 -1 -1  1  1 NA

## Compute angle differences
##__________________________________________________
## Must return NA, 45, 45, 45
angle_diff(c(330, 15, 60, 15))
#> [1] NA 45 45 45

## Compute GPS Heading
##_____________________________________________________
## Must return heading directions except for the last entry, which is NA
with(cities, compute_gps_heading(latitude, longitude))
#> [1] 206.338934 326.223102 318.954230 358.754675   6.003073 342.964883 318.586753
#> [8]         NA


## Assign turn labels
##_____________________________________________________
## Must return vector of "left", "rigth", "none"
cp_signs <- cross_prod_sign(cities$latitude, cities$longitude)
heading <- compute_gps_heading(cities$latitude, cities$longitude)
heading_diffs <- angle_diff(heading)
classify_turns(cp_signs, heading_diffs, 20)
#> [1] NA      "right" "none"  "right" "none"  "left"  "left"  NA
```
