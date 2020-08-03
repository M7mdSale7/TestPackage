#' Summarize the number of accidents for per month for each year
#'
#' Takes a character or integer vector of years and returns a dataframe. The dataframe's first column
#' is \code{MONTH} and the rest represent the year with each observation representing the month
#' and number of accidents for each year. Shows a warning for each invalid year.
#'
#' @param years character or integer vector containing the years
#'
#' @importFrom dplyr bind_rows
#' @importFrom dplyr group_by
#' @importFrom dplyr summarize
#' @importFrom tidyr spread
#'
#' @export
#'
#' @examples
#' \dontrun{
#' fars_summarize_years(c(2013,2014,2015))
#' fars_summarize_years(c("2013","2014","2015"))
#' }
#'
#' @return This function returns a \code{tbl_df} representing the summary of number of accients per month for each year.

fars_summarize_years <- function(years) {
  dat_list <- fars_read_years(years)
  dplyr::bind_rows(dat_list) %>%
    dplyr::group_by(year, MONTH) %>%
    dplyr::summarize(n = n()) %>%
    tidyr::spread(year, n)
}
