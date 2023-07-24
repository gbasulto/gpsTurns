
cross_prod_sign <- function(lat, lon) {
  len <- length(lat)

  lat0 <- c(NA, lat[-len])
  lat1 <- c(lat[-1], NA)
  lon0 <- c(NA, lon[-len])
  lon1 <- c(lon[-1], NA)

  crossprod <- (lon - lon0) * (lat1 - lat) - (lat -lat0) * (lon1 - lon)

  sign(crossprod)
}
