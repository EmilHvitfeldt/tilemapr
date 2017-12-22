#' Creates square tile map for the states of USA.
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
#' @return The available styles for this functions are "NPR",
#'   "The New York Times", "538", "Propublica", "Bloomberg", "The Guardian",
#'   "Wall Street Journal", "WNYC" or "The Marshall Project".
#' @examples
#' \dontrun{
#' library(ggplot2)
#' crimes <- data.frame(state = tolower(rownames(USArrests)), USArrests)
#' states_map <- square_usa()

#' ggplot(crimes, aes(map_id = state)) +
#'   geom_map(aes(fill = Murder), map = states_map) +
#'   expand_limits(x = states_map$long, y = states_map$lat)
#'
#' states_map <- square_usa(d = 0.5)
#'
#' ggplot(crimes, aes(map_id = state)) +
#'   geom_map(aes(fill = Murder), map = states_map) +
#'   expand_limits(x = states_map$long, y = states_map$lat) +
#'   geom_text(data = square_usa(d = 0.5, center = TRUE),
#'             aes(x = long, y = lat, label = states_abb),
#'             inherit.aes = FALSE)
#'}
#'@export
square_usa <- function(d = 0.95, center = FALSE, style = "NPR",
                       size = 1, long_offset = 0, lat_offset = 0,
                       exclude = character()) {
  if(d <= 0 || d > 1) {
    warning("d must be in the interval (0, 1], defaulted to 0.95")
    d <- 0.95
  }

  if(!(style %in% c("NPR", "The New York Times", "538", "Propublica",
                  "Bloomberg", "The Guardian", "Wall Street Journal", "WNYC",
                  "The Marshall Project"))) {
    warning("Unable to recognize style, defaulted to NPR")
    STYLE <- "NPR"
  } else {
    STYLE <- style
  }

  exclude <- intersect(square_usa_data$region, exclude)
  d <- d / 2 * size

  dat0 <- square_usa_data %>%
    dplyr::filter(style == STYLE) %>%
    dplyr::select(- style) %>%
    dplyr::mutate(long = ~long * size,
                  lat = ~lat * size)

  dat1 <- rbind(dat0 %>% dplyr::mutate(long = ~long + d, lat = ~lat + d),
                dat0 %>% dplyr::mutate(long = ~long - d, lat = ~lat + d),
                dat0 %>% dplyr::mutate(long = ~long - d, lat = ~lat - d),
                dat0 %>% dplyr::mutate(long = ~long + d, lat = ~lat - d)) %>%
    dplyr::mutate(group = as.numeric(~group))

  if (center) {
    dat2 <- dat0 %>%
      dplyr::mutate(long = ~long - dat1[114, "long"] + long_offset,
                    lat = ~lat - dat1[114, "lat"] + lat_offset) %>%
      dplyr::filter(!(~region %in% exclude))
    return(dat2)
  } else {
    dat2 <- dat1 %>%
      dplyr::mutate(long = ~long - dat1[114, "long"] + long_offset,
                    lat = ~lat - dat1[114, "lat"] + lat_offset) %>%
      dplyr::filter(!(~region %in% exclude))
    return(dat2[order(dat2$region), ] %>%
             dplyr::mutate(order = 1:(204 - length(exclude) * 4)))
  }
}
