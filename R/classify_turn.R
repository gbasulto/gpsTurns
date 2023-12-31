
#' Classify turns
#'
#' Determines whether a turn was left, right, or no turn based on the sign of
#' the cross product, the heading difference, and the angle threshold to
#' determine if the change in direction was a turn.
#'
#' @param crossprod_sign Vector of cross product signs. Usually the output of
#'   \code{\link{cross_prod_sign}}.
#' @param heading_difference Vector of heading differences. Usually the output
#'   of \code{\link{angle_diff}}.
#' @param angle_threshold A scalar between 0 and 180 to set the minimum
#'   threshold of what constitutes a turn.
#'
#' @return A vector of labels: "right", "none", "left".
#' @export
#'
#' @examples
#' cities <-
#' tibble::tribble(
#'   ~city, ~latitude, ~longitude,
#'   "Las Vegas", 36.1699, -115.1398,
#'   "San Diego", 32.7157, -117.1611,
#'   "Los Angeles", 34.0522, -118.2437,
#'   "San Francisco", 37.7749, -122.4194,
#'   "Portland", 45.5122, -122.6587,
#'   "Seattle", 47.6062, -122.3321,
#'   "Vancouver", 49.2827, -123.1207,
#'   "Anchorage", 61.2181, -149.9003
#' )
#'
#' cp_signs <- cross_prod_sign(cities$latitude, cities$longitude)
#' heading <- compute_gps_heading(cities$latitude, cities$longitude)
#' heading_diffs <- angle_diff(heading)
#' classify_turns(cp_signs, heading_diffs, 20)
classify_turns <- function (
    crossprod_sign, heading_difference, angle_threshold
) {
  ## Shorten names
  cps <- crossprod_sign
  hd <- heading_difference
  alpha <- angle_threshold

  ## Compute turn direction
  aux <- 1 + (cps > 0) * (hd > alpha) + 2 * (cps < 0) * (hd > alpha)
  c("none", "left", "right")[aux]
}
