#' Extract \code{YEAR} and \code{MONTH} columns from US yearly accidents data set.
#'
#' Takes a character or integer vector of years as input, reads the file of each year, and then
#' extracts the \code{YEAR} and \code{MONTH} columns from each file. Throws a warning and returns NULL.
#' for the unfound file.
#'
#' @param years a character or integer vector containing the years
#'
#' @importFrom dplyr mutate
#' @importFrom dplyr select
#'
#' @export
#'
#' @examples
#' \donttest{
#' fars_read_years(c(2013, 2014, 2015))
#' fars_read_years(c("2013", "2014", "2015"))
#' }
#'
#' @return This function returns a \code{list} with each element of the list containing the \code{YEAR}
#'  and \code{MONTH} columns of each file. It returns NULL for a file it is not found.
fars_read_years <- function(years) {
  lapply(years, function(year) {
    file <- make_filename(year)
    tryCatch({
      dat <- fars_read(file)
      dplyr::mutate(dat, year = year) %>%
        dplyr::select(MONTH, year)
    }, error = function(e) {
      warning("invalid year: ", year)
      return(NULL)
    })
  })
}
