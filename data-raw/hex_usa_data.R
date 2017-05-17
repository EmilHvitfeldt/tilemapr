states <- c("alabama", "alaska", "arizona", "arkansas", "california",
            "colorado", "connecticut", "delaware", "district of columbia", "florida","georgia",
            "hawaii", "idaho", "illinois", "indiana", "iowa", "kansas",
            "kentucky", "louisiana", "maine", "maryland", "massachusetts",
            "michigan", "minnesota", "mississippi", "missouri", "montana",
            "nebraska", "nevada", "new hampshire", "new jersey", "new mexico",
            "new york", "north carolina", "north dakota", "ohio", "oklahoma",
            "oregon", "pennsylvania", "rhode island", "south carolina",
            "south dakota", "tennessee", "texas", "utah", "vermont",
            "virginia", "washington", "west virginia", "wisconsin", "wyoming")

# NPR
long <- c(8.5, 1.5, 4.5, 7, 3, 4.5, 12, 11.5, 11, 9, 9.5,
          1, 3, 7, 8, 6, 6, 7.5, 6.5, 12.5, 10.5,
          11.5, 8.5, 5.5, 7.5, 6.5, 3.5, 5.5, 3.5, 12, 11,
          5, 10.5, 9, 4.5, 9, 5.5, 2.5, 10, 12.5, 10,
          5, 8, 6, 4, 11, 9.5, 2.5, 8.5, 6.5, 4)
lat <-  c(2, 8, 2, 3, 3, 4, 5, 4, 3, 1, 2,
          1, 5, 5, 5, 5, 3, 4, 2, 8, 4,
          6, 6, 6, 2, 4, 6, 4, 4, 7, 5,
          3, 6, 3, 6, 5, 2, 4, 5, 6, 3,
          5, 3, 1, 3, 7, 4, 6, 4, 6, 5)
dat_npr <- data.frame(long = long,
                      lat = lat,
                      group = 1:51,
                      region = states,
                      region_abr = c(state.abb[1:8], "DC", state.abb[9:50]),
                      subregion = rep(NA, 51),
                      stringsAsFactors = FALSE,
                      style = "NPR")

hex_usa_data <- rbind(dat_npr)
