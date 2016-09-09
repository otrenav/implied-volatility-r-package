#' Test Data for European Options
#'
#' A dataset with 20 observations of 5 variables. The variables
#' are type, value, underlying, strike, and maturity. They are
#' used to test the implied volatility functions in this package.
#'
#' @format A data frame with 20 observations and 5 variables:
#' \describe{
#'   \item{type}{One of the two values: 'call' or 'put' (string)}
#'   \item{value}{Value of the option (number)}
#'   \item{underlying}{Current price of the underlying (number)}
#'   \item{strike}{Strike price of the option (number)}
#'   \item{maturity}{Time to maturity in fractional years (number)}
#' }
"european_options"