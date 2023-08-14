test_that("calculate_longest_na_seq", {
  ## Max = 3
  ## NA sequences: 4
  x <- c(1, NA, 2, NA, NA, 3, 4, NA, NA, NA, 5, 6, 7, NA)
  out <- calculate_longest_na_seq(x)
  #> [1] 3
  expect_equal(out, 3)
})

test_that("calculate_number_of_na_seqs", {
  ## NA sequences: 4
  x <- c(1, NA, 2, NA, NA, 3, 4, NA, NA, NA, 5, 6, 7, NA)
  out <- calculate_number_of_na_seqs(x)
  #> [1] 4

  expect_equal(out, 4)
})
