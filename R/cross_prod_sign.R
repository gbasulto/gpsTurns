
#' Cross Product Sign
#'
#' Calculate the sign of the cross product.
#'
#' Negative values are associated with right turns while positive values with
#' left turns.
#'
#' @param lat Vector of latitudes of size n.
#' @param lon Vector of longitudes of size n.
#'
#' @return Vector of cross product signs of size n. The first element and last
#'   elements are NA.
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
#' with(cities, cross_prod_sign(latitude, longitude))
cross_prod_sign <- function(lat, lon) {
  len <- length(lat)

  lat0 <- c(NA, lat[-len])
  lat1 <- c(lat[-1], NA)
  lon0 <- c(NA, lon[-len])
  lon1 <- c(lon[-1], NA)

  crossprod <- (lon - lon0) * (lat1 - lat) - (lat -lat0) * (lon1 - lon)

  sign(crossprod)
}
