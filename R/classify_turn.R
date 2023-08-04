
#' Classify turns
#'
#'
#'
#' @param crossprod_sign a
#' @param heading_difference b
#' @param angle_threshold c
#'
#' @return we
#' @export
#'
#' @examples
#' 1 + 1
classify_turn <- function (
    crossprod_sign, heading_difference, angle_threshold
) {
  ## Shorten names
  cps <- crossprod_sign
  hd <- heading_difference
  alpha <- angle_threshold

  ## Compute sign
  case_when(
    (cps > 0) & (hd > alpha) ~ "left",
    (cps < 0) & (hd > alpha) ~ "right",
    TRUE ~ "none")
}
