#' Generate an accidents file from a year input
#'
#' Generates a character vector of length 1 with representing the file name storing the american
#' yearly data regarding fatal injuries suffered in motor vehicle traffic crashes of the \code{year}
#' inputted
#'
#' @param year a vector of length 1 with the year desired
#'
#' @export
#'
#' @examples
#' make_filename(2013)
#' make_filename("2013")
#'
#' @return This function returns a character vector representing the file name of the accidents at the \code{year}
make_filename <- function(year) {
  year <- as.integer(year)
  sprintf("accident_%d.csv.bz2", year)
}
