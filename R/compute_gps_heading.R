#' Compute GPS Heading
#'
#' Calculate the heading of two vectors of coordinates.
#'
#' @param latitude Vector of latitudes of size n.
#' @param longitude Vector of longitudes of size n.
#'
#' @return Vector of headings (between 0 and 360) of size n. The last entry is
#'   \code{NA}.
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
#' with(cities, compute_gps_heading(latitude, longitude))
compute_gps_heading <- function(latitude, longitude) {

  n <- length(latitude)
  lat1 <- latitude[-n]
  lat2 <- latitude[-1]
  lon1 <- longitude[-n]
  lon2 <- longitude[-1]

  # Convert degrees to radians
  lat1_rad <- lat1 * (pi / 180)
  lon1_rad <- lon1 * (pi / 180)
  lat2_rad <- lat2 * (pi / 180)
  lon2_rad <- lon2 * (pi / 180)

  # Compute differences
  delta_lon_rad <- lon2_rad - lon1_rad

  # Compute heading
  y <- sin(delta_lon_rad) * cos(lat2_rad)
  x <- cos(lat1_rad) * sin(lat2_rad) -
    sin(lat1_rad) * cos(lat2_rad) * cos(delta_lon_rad)
  heading_rad <- atan2(y, x)

  # Convert heading from radians to degrees
  heading_deg <- heading_rad * (180 / pi)

  # Normalize heading to a range from 0 to 360 degrees
  heading_deg <- (heading_deg + 360) %% 360

  return(c(heading_deg, NA))
}




