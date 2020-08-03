#' pre_reading checking for existence of a .csv file.
#'
#' Checks for existence of a .csv file. If it exists, \code{fars_read} returns the contents as
#' an object of class "tbl_df". If the file does not exist, \code{fars_read} returns an error.
#'
#' @param filename a path to a file, a connection, or literal data
#'
#' @importFrom readr read_csv
#' @importFrom dplyr tbl_df
#'
#' @export
#'
#' @examples
#' \donttest{
#' fars_read("accident_2013.csv")
#' fars_read("accident_2014.csv")
#' fars_read("accident_2015.csv")
#' }
#'  \dontrun{
#'	##long paths
#'	read_csv("https://github.com/tidyverse/readr/raw/master/inst/extdata/mtcars.csv")
#'  }
#'
#' @return This function returns a \code{tbl_df} representing the contents of \code{filename}
fars_read <- function(filename) {
  if(!file.exists(filename))
    stop("file '", filename, "' does not exist")
  data <- suppressMessages({
    readr::read_csv(filename, progress = FALSE)
  })
  dplyr::tbl_df(data)
}
