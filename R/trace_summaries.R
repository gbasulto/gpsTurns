
#' Size of longest sequence of NAs
#'
#' Calculate the longest sequence of NAs in a vector. Zero si returned if there are no NAs.
#'
#' @param x Vector with NAs.
#'
#' @return Integer with the size of the longest consecutive NAs in vector x.
#' @export
#'
#' @examples
#' ## Max = 3
#' ## NA sequences: 4
#' x <- c(1, NA, 2, NA, NA, 3, 4, NA, NA, NA, 5, 6, 7, NA)
#' calculate_longest_na_seq(x)
#' calculate_number_of_na_seqs(x)
calculate_longest_na_seq <- function(x) {

  ## Indicate if entries are NAs
  nas <- is.na(x)
  nn <- length(nas)

  ## Create groups of consecutive NAs and or consecutive non-NAs
  group <- cumsum(c(1, abs(diff(nas))))

  ## Keep groups of NAs. Discard groups that are not NAs.
  groups_of_nas <- group[nas]

  ## Return 0 if there is no NAs
  if (length(groups_of_nas) == 0) return(0)

  max(table(groups_of_nas))
}


#' Total NA sequences
#'
#' Compute the number of sequences of NAs. Returns zero if there are no missing values.
#'
#' @param x Vector with, potentially, missing values.
#'
#' @return An integer witht the total number of sequences.
#' @export
#'
#' @examples
#' ## Max = 3
#' ## NA sequences: 4
#' x <- c(1, NA, 2, NA, NA, 3, 4, NA, NA, NA, 5, 6, 7, NA)
#' calculate_longest_na_seq(x)
#' calculate_number_of_na_seqs(x)
calculate_number_of_na_seqs <- function(x) {

  ## Indicate if entries are NAs
  nas <- is.na(x)
  nn <- length(nas)

  ## Create groups of consecutive NAs and or consecutive non-NAs
  group <- cumsum(c(1, abs(diff(nas))))

  ## Keep groups of NAs. Discard groups that are not NAs.
  groups_of_nas <- group[nas]

  ## Return 0 if there is no NAs
  if (length(groups_of_nas) == 0) return(0)

  length(table(groups_of_nas))
}
