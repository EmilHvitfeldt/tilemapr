#' Creates hexagonal tile map for the states of USA.
#'
#' @param d Numeric. Number between 0 and 1. Procentwise Diameter (length from
#'   center to corner) of the tiles.
#' @param center Logical. When TRUE returns the center coordinates of the tile
#'   map.
#' @param style Character. Selets the layout style of the tile map.
#' @param size Numeric. Size of the tiles.
#' @param long_offset Numeric. Value to offset the long output.
#' @param lat_offset Numeric. Value to offset the lat output.
#' @param exclude Character. Vector of state names which should be excluded
#'   from the output. Matched with lowercase full state names.
#' @return The available styles for this functions are "NPR".
#' @examples
#' library(ggplot2)
#' crimes <- data.frame(state = tolower(rownames(USArrests)), USArrests)
#' states_map <- hex_usa()
#'
#' ggplot(crimes, aes(map_id = state)) +
#'   geom_map(aes(fill = Murder), map = states_map) +
#'   expand_limits(x = states_map$long, y = states_map$lat)
#'
#' states_map <- hex_usa(d = 0.5)
#'
#' ggplot(crimes, aes(map_id = state)) +
#'   geom_map(aes(fill = Murder), map = states_map) +
#'   expand_limits(x = states_map$long, y = states_map$lat) +
#'   geom_text(data = hex_usa(d = 0.5, center = TRUE),
#'             aes(x = long, y = lat, label = states_abb),
#'             inherit.aes = FALSE)
hex_usa <- function(d = 0.95, center = FALSE, style = "NPR",
                    size = 1, long_offset = 0, lat_offset = 0,
                    exclude = character()) {

  if(d <= 0 || d > 1) {
    warning("d must be in the interval (0, 1], defaulted to 0.95")
    d <- 0.95
  }
  if(!(style %in% c("NPR"))) {
    warning("Unable to recognize style, defaulted to NPR")
    STYLE <- "NPR"
  } else {
    STYLE <- style
  }

  exclude <- intersect(hex_usa_data$region, exclude)
  a <- size / 2
  r <- a * 2 / sqrt(3)

  dat0 <- hex_usa_data %>%
    filter(style == STYLE) %>%
    select(- style) %>%
    mutate(long = long * size,
           lat = lat * size * (r + a / sqrt(3)))

  a <- size / 2 * d
  r <- a * 2 / sqrt(3)

  dat1 <- rbind(dat0 %>% mutate(long = long, lat = lat + r),
                dat0 %>% mutate(long = long + a, lat = lat + a / sqrt(3)),
                dat0 %>% mutate(long = long + a, lat = lat - a / sqrt(3)),
                dat0 %>% mutate(long = long, lat = lat - r),
                dat0 %>% mutate(long = long - a, lat = lat - a / sqrt(3)),
                dat0 %>% mutate(long = long - a, lat = lat + a / sqrt(3))) %>%
    mutate(group = as.numeric(group))

  if (center) {
    dat2 <- dat0 %>%
      mutate(long = long - dat1[165, "long"] + long_offset,
             lat = lat - dat1[165, "lat"] + lat_offset) %>%
      filter(!(region %in% exclude))
    return(dat2)
  } else {
    dat2 <- dat1 %>%
      mutate(long = long - dat1[165, "long"] + long_offset,
             lat = lat - dat1[165, "lat"] + lat_offset) %>%
      filter(!(region %in% exclude))
    return(dat2[order(dat2$region), ] %>%
             mutate(order = 1:(306 - length(exclude) * 6)))
  }
}
