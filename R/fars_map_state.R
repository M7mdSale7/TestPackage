#' plot the geographic locations of accidents in a state during a certain year
#'
#' Takes \code{state.num} and \code{year} as arguments and plots the locations of the accidents in a state
#' during a year.
#'
#' @param state.num a character or integer vector of length 1 representing the state number intended
#' @param year a character or integer vector of length 1 representing the year desired
#'
#' @importFrom dplyr filter
#' @importFrom maps map
#' @importFrom graphics points
#'
#' @export
#'
#' @examples
#' \dontrun{
#' fars_map_state(1,2013)
#' fars_map_state("1", "2013")
#' }
#'
#' @return This function returns NULL and plots the locations of accidents on map in a state
fars_map_state <- function(state.num, year) {
  filename <- make_filename(year)
  data <- fars_read(filename)
  state.num <- as.integer(state.num)

  if(!(state.num %in% unique(data$STATE)))
    stop("invalid STATE number: ", state.num)
  data.sub <- dplyr::filter(data, STATE == state.num)
  if(nrow(data.sub) == 0L) {
    message("no accidents to plot")
    return(invisible(NULL))
  }
  is.na(data.sub$LONGITUD) <- data.sub$LONGITUD > 900
  is.na(data.sub$LATITUDE) <- data.sub$LATITUDE > 90
  with(data.sub, {
    maps::map("state", ylim = range(LATITUDE, na.rm = TRUE),
              xlim = range(LONGITUD, na.rm = TRUE))
    graphics::points(LONGITUD, LATITUDE, pch = 46)
  })
}
