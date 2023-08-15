aggregate_by_segment_and_label_turns <- function (
    gps_data, segment_length_mi, angle_threshold, minimum_speed_mph) {

  ## Required_variables in gps_data
  ## gps_data is sorted out in chronological order
  ## drive_miles: cumulative distance in miles of gps_data
  ## gps_long: longitude
  ## gps_lat: latitude
  ## gps_heading: heading (0 to 360, 0 is North and 90 is East)
  ## speed_mph: Speed in mph.

  gps_data |>
    ## Filter speed
    filter(speed_mph >= {{minimum_speed_mph}}) |>

    ## Create segment cluster starting at 1
    mutate(segment = ceiling(drive_miles / segment_length_mi)) |>
    group_by(segment) |>

    ## Aggregate data
    summarize(gps_long = mean(gps_long, na.rm = TRUE),
              gps_lat = mean(gps_lat, na.rm = TRUE),
              heading = median(gps_heading, na.rm = TRUE)) |>

    ## Calculate cross product, heading difference, and turn
    mutate(
      crossprod_sign = gpsTurns::cross_prod_sign(gps_lat, gps_long),
      heading_difference = gpsTurns::angle_diff(heading),
      turn = gpsTurns::classify_turns(
        crossprod_sign, heading_difference, angle_threshold))
}
