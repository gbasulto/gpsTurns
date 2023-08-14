test_that("turn_labels-works", {

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

  ## Must return vector of "left", "rigth", "none"
  cp_signs <- cross_prod_sign(cities$latitude, cities$longitude)
  heading <- compute_gps_heading(cities$latitude, cities$longitude)
  heading_diffs <- angle_diff(heading)
  out <- classify_turns(cp_signs, heading_diffs, 20)

  expect_true(is.na(out[1]), label = "First entry is NA")
  expect_false(is.na(out[8]), label = "Last entry is NA")
  expect_equal(is.na(out[2]), "right")
  expect_equal(is.na(out[2]), "none")
})
