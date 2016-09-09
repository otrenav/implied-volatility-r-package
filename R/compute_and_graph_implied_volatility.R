#'
#' Append and Graph Implied Volatility
#'
#' \code{compute_and_append_implied_volatility} returns a dataframe with the implied volatility appended and graphs it
#'
#' This function uses the functions \code{append_implied_volatility} and
#' \code{graph_implied_volatility} from this package to compute and graph
#' the implied volatility for European Options, respectively.
#'
#' @param df Dataframe with European Options data (see details)
#' @param risk_free_rate Risk-free rate (number, default: 0.01)
#' @param initial_volatility_guess Initial guess volatility guess (default: 0.5)
#' @return dataframe Same dataframe with appended \code{ImpliedVolatility} column (dataframe)
#'
#' @author John Dole <jdoleiv@gmail.com>
#'
#' @details
#' The columns in the dataframe should be as follows:
#' - \code{Type}: One of the two values: 'call' or 'put' (string)
#' - \code{Value}: Value of the option (number)
#' - \code{Underlying}: Current price of the underlying (number)
#' - \code{Strike}: Strike price of the option (number)
#' - \code{Maturity}: Time to maturity in fractional years (number)
#'
#' TODO: Model/financial restrictions on the parameters should be made clear here...
#'
#' The \code{EuropeanOptionImpliedVolatility} function asks for a
#' \code{dividend_yield} which we assume to be 0 as this is not a stock.
#'
#' Fore more information about RQuantLib:
#' https://cran.r-project.org/web/packages/RQuantLib/RQuantLib.pdf
#'
#' For more information about QuantLib:
#' http://quantlib.org/index.shtml
#'
#' @seealso \code{append_implied_volatility}
#' @seealso \code{compute_implied_volatility}
#' @seealso \code{graph_implied_volatility}
#' @seealso \code{EuropeanOptionImpliedVolatility}
#'
#' @examples
#' library(ImpliedVolatility)
#' data(european_options)
#' results <- compute_and_graph_implied_volatility(european_options)
#'
#' @export
#'

compute_and_graph_implied_volatility <- function(df,
                                                 risk_free_rate = 0.01,
                                                 initial_volatility_guess = 0.5) {
    df <- append_implied_volatility(df)
    print(graph_implied_volatility(df))
    return(df)
}
