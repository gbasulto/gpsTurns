
#' Angle Difference
#'
#' Compute the angle difference. The Output are values between 0 and 180
#' degrees.
#'
#' @param theta Vector of angles of size n.
#'
#' @return A vector of size `n` whose first entry is NA, the second is the
#'   difference between the 2nd and 1st, and so on.
#' @export
#'
#' @examples
#' angle_diff(c(330, 15, 60, 15))
angle_diff <- function(theta) {

  len <- length(theta)

  ## Define angles and convert them to radians
  th1 <- c(NA, theta[-len]) / 360 * 2 * pi
  th2 <- theta / 360 * 2 * pi

  acos(cos(th1 - th2)) / 2 / pi * 360
}

