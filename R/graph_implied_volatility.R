#'
#' Graph Implied Volatility
#'
#' \code{graph_implied_volatility} graphs the implied volatility in a dataframe
#'
#' This function receives as input a dataframe that contains at least the columns
#' \code{Strike} and \code{ImpliedVolatility}. It primarily intended to be used
#' with the output dataframe from the \code{append_implied_volatility} function.
#'
#' @param df Dataframe with \code{Strike} and \code{ImpliedVolatility} columns
#'
#' @author John Dole <jdoleiv@gmail.com>
#'
#' @details
#' The columns in the dataframe should be as follows:
#' - \code{Strike}: Strike price of the option (number)
#' - \code{ImpliedVolatility}: implied volatility (number)
#'
#' @seealso \code{append_implied_volatility}
#' @seealso \code{compute_implied_volatility}
#' @export
#'

graph_implied_volatility <- function(df) {
    ggplot2::ggplot(df, aes(x=Strike, y=ImpliedVolatility)) + geom_line()
}
