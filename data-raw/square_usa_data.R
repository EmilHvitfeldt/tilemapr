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
long <- c(8, 1, 3, 6, 2, 4, 11, 11, 10, 10, 9,
          1, 3, 7, 7, 6, 5, 7, 6, 12, 10,
          12, 9, 6, 7, 6, 4, 5, 3, 12, 10,
          4, 10, 8, 5, 8, 5, 2, 9, 11, 9,
          5, 7, 5, 3, 11, 9, 2, 8, 8, 4)
lat <-  c(2, 8, 3, 3, 4, 4, 5, 4, 3, 1, 2,
          1, 6, 6, 5, 5, 3, 4, 2, 8, 4,
          6, 6, 6, 2, 4, 6, 4, 5, 7, 5,
          3, 6, 3, 6, 5, 2, 5, 5, 6, 3,
          5, 3, 1, 4, 7, 4, 6, 4, 6, 5)
dat_npr <- data.frame(long = long,
                       lat = lat,
                       group = 1:51,
                       region = states,
                       region_abr = c(state.abb[1:8], "DC", state.abb[9:50]),
                       subregion = rep(NA, 51),
                       stringsAsFactors = FALSE,
                       style = "NPR")

# The New York Times
long <- c(7, 1, 3, 6, 1, 4, 11, 11, 9, 8, 8,
          1, 3, 7, 8, 6, 5, 7, 5, 12, 10,
          12, 8, 6, 6, 6, 3, 5, 2, 11, 11,
          4, 10, 9, 4, 9, 5, 2, 10, 12, 9,
          5, 7, 4, 3, 10, 8, 2, 8, 7, 4)
lat <-  c(2, 7, 3, 3, 4, 4, 6, 4, 4, 1, 2,
          2, 5, 5, 5, 5, 4, 4, 2, 8, 4,
          7, 6, 6, 2, 4, 6, 5, 4, 7, 5,
          3, 6, 3, 6, 5, 3, 5, 5, 6, 2,
          6, 3, 2, 4, 7, 3, 6, 4, 6, 5)
dat_tnyt <- data.frame(long = long,
                       lat = lat,
                       group = 1:51,
                       region = states,
                       region_abr = c(state.abb[1:8], "DC", state.abb[9:50]),
                       subregion = rep(NA, 51),
                       stringsAsFactors = FALSE,
                       style = "The New York Times")

# 538
long <- c(7, 2, 2, 5, 1, 3, 10, 10, NA, 9, 8,
          1, 2, 6, 6, 5, 4, 6, 5, 11, 9,
          10, 7, 5, 6, 5, 3, 4, 2, 11, 9,
          3, 9, 7, 4, 7, 4, 1, 8, 11, 8,
          4, 6, 4, 2, 10, 8, 1, 7, 6, 3)
lat <-  c(2, 1, 3, 3, 4, 4, 5, 4, NA, 1, 2,
          1, 6, 6, 5, 5, 3, 4, 2, 8, 4,
          6, 6, 6, 2, 4, 6, 4, 5, 7, 5,
          3, 6, 3, 6, 5, 2, 5, 5, 5, 3,
          5, 3, 1, 4, 7, 4, 6, 4, 7, 5)
dat_538 <- data.frame(long = long,
                      lat = lat,
                      group = 1:51,
                      region = states,
                      region_abr = c(state.abb[1:8], "DC", state.abb[9:50]),
                      subregion = rep(NA, 51),
                      stringsAsFactors = FALSE,
                      style = "538")

# Propublica
long <- c(8, 2, 3, 6, 2, 4, 11, 11, NA, 10, 9,
          1, 3, 7, 7, 6, 5, 7, 6, 12, 10,
          11, 8, 6, 7, 6, 4, 5, 3, 12, 10,
          4, 10, 8, 5, 8, 5, 2, 9, 12, 9,
          5, 7, 5, 3, 11, 9, 2, 8, 6, 4)
lat <-  c(2, 1, 3, 3, 4, 4, 5, 4, NA, 1, 2,
          1, 6, 6, 5, 5, 3, 4, 2, 8, 4,
          6, 6, 7, 2, 4, 6, 4, 5, 7, 5,
          3, 6, 3, 6, 5, 2, 5, 5, 5, 3,
          5, 3, 1, 4, 7, 4, 6, 4, 6, 5)
dat_Propublica <- data.frame(long = long,
                             lat = lat,
                             group = 1:51,
                             region = states,
                             region_abr = c(state.abb[1:8], "DC", state.abb[9:50]),
                             subregion = rep(NA, 51),
                             stringsAsFactors = FALSE,
                             style = "Propublica")

# Bloomberg
long <- c(8, 1, 3, 6, 2, 4, 11, 11, NA, 10, 9,
          1, 3, 7, 7, 6, 5, 7, 6, 12, 10,
          11, 8, 6, 7, 6, 4, 5, 3, 12, 10,
          4, 10, 10, 5, 8, 5, 2, 9, 12, 9,
          5, 8, 6, 3, 11, 9, 2, 8, 7, 4)
lat <-  c(2, 7, 3, 3, 4, 4, 5, 4, NA, 1, 2,
          2, 6, 5, 4, 5, 3, 3, 2, 8, 4,
          6, 6, 6, 2, 4, 6, 4, 4, 7, 5,
          3, 6, 3, 6, 5, 2, 5, 5, 6, 3,
          5, 3, 1, 5, 7, 4, 6, 4, 6, 5)
dat_Bloomberg <- data.frame(long = long,
                            lat = lat,
                            group = 1:51,
                            region = states,
                            region_abr = c(state.abb[1:8], "DC", state.abb[9:50]),
                            subregion = rep(NA, 51),
                            stringsAsFactors = FALSE,
                            style = "Bloomberg")

# The Guardian
long <- c(8, 2, 3, 6, 2, 4, 12, 11, 11, 9, 9,
          1, 3, 7, 8, 6, 5, 8, 6, 13, 12,
          12, 8, 6, 7, 6, 4, 5, 3, 13, 11,
          4, 10, 10, 5, 9, 5, 2, 10, 13, 10,
          5, 7, 5, 3, 12, 10, 2, 9, 7, 4)
lat <-  c(2, 8, 2, 3, 3, 3, 5, 5, 4, 1, 2,
          1, 5, 4, 4, 5, 3, 3, 2, 8, 4,
          6, 5, 6, 2, 4, 5, 4, 4, 7, 6,
          2, 6, 3, 6, 4, 2, 4, 5, 6, 2,
          5, 3, 1, 3, 7, 4, 5, 3, 5, 4)
dat_Guardian <- data.frame(long = long,
                           lat = lat,
                           group = 1:51,
                           region = states,
                           region_abr = c(state.abb[1:8], "DC", state.abb[9:50]),
                           subregion = rep(NA, 51),
                           stringsAsFactors = FALSE,
                           style = "The Guardian")

# Wall street journal
long <- c(7, 1, 2, 5, 1, 3, 11, 11, 9, 9, 8,
          1, 2, 6, 7, 5, 4, 7, 5, 11, 10,
          10, 7, 5, 6, 5, 3, 4, 2, 11, 10,
          3, 9, 7, 4, 8, 4, 1, 9, 11, 8,
          4, 6, 4, 2, 10, 9, 1, 8, 6, 3)
lat <-  c(2, 8, 3, 3, 4, 4, 5, 4, 3, 1, 2,
          1, 6, 4, 5, 5, 3, 4, 2, 8, 4,
          6, 6, 6, 2, 4, 6, 4, 4, 7, 5,
          3, 6, 3, 6, 5, 2, 5, 5, 6, 3,
          5, 3, 1, 5, 7, 4, 6, 4, 5, 5)
dat_wsj <- data.frame(long = long,
                      lat = lat,
                      group = 1:51,
                      region = states,
                      region_abr = c(state.abb[1:8], "DC", state.abb[9:50]),
                      subregion = rep(NA, 51),
                      stringsAsFactors = FALSE,
                      style = "Wall Street Journal")

# WNYC
long <- c(8, 1, 3, 6, 2, 4, 11, 10, 12, 10, 9,
          1, 3, 7, 7, 6, 5, 8, 6, 12, 9,
          12, 8, 6, 7, 6, 4, 5, 3, 11, 11,
          4, 10, 10, 5, 8, 5, 2, 9, 12, 10,
          5, 7, 5, 3, 10, 9, 2, 8, 7, 4)
lat <-  c(2, 7, 3, 3, 4, 4, 5, 4, 2, 1, 2,
          1, 6, 4, 5, 5, 3, 4, 2, 7, 4,
          6, 6, 6, 2, 4, 6, 4, 5, 6, 4,
          3, 5, 3, 6, 5, 2, 5, 5, 5, 2,
          5, 3, 1, 4, 6, 3, 6, 3, 6, 5)
dat_wnyc <- data.frame(long = long,
                       lat = lat,
                       group = 1:51,
                       region = states,
                       region_abr = c(state.abb[1:8], "DC", state.abb[9:50]),
                       subregion = rep(NA, 51),
                       stringsAsFactors = FALSE,
                       style = "WNYC")

# The Marshall Project
long <- c(7, 1, 2, 5, 1, 3, 10, 9, NA, 10, 8,
          2, 2, 6, 6, 5, 4, 7, 5, 11, 8,
          11, 7, 5, 6, 5, 3, 4, 2, 10, 10,
          3, 9, 9, 4, 7, 4, 1, 8, 11, 9,
          4, 6, 4, 2, 9, 8, 1, 7, 6, 3)
lat <-  c(2, 1, 3, 3, 4, 4, 5, 4, NA, 1, 2,
          1, 6, 4, 5, 5, 3, 4, 2, 7, 4,
          6, 6, 6, 2, 4, 6, 4, 5, 6, 4,
          3, 5, 3, 6, 5, 2, 5, 5, 5, 2,
          5, 3, 1, 4, 6, 3, 6, 3, 6, 5)
dat_marshall <- data.frame(long = long,
                           lat = lat,
                           group = 1:51,
                           region = states,
                           region_abr = c(state.abb[1:8], "DC", state.abb[9:50]),
                           subregion = rep(NA, 51),
                           stringsAsFactors = FALSE,
                           style = "The Marshall Project")

square_usa_data <- rbind(dat_538, dat_Bloomberg, dat_Guardian, dat_marshall,
                         dat_Propublica, dat_tnyt, dat_wnyc, dat_wsj, dat_npr)
