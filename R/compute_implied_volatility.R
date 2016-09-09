#'
#' Append European Option Implied Volatilities to DataFrame
#'
#' \code{append_implied_volatility} returns a dataframe with European Option implied volatilities
#'
#' This function computes the volatilty of a European Option for each row
#' in the dataframe that is passed to it. It will do so using the
#' \code{compute_implied_volatility} function in this package, which is a
#' wrapper around the \code{EuropeanOptionImpliedVolatility} function from the
#' \code{RQUantLib} package.
#'
#' @param df Dataframe with columns named type, value, underlying, strike, and maturity
#' @param risk_free_rate Risk-free rate (number, default: 0.01)
#' @param initial_volatility_guess Initial guess for the volatility (number, default: 0.5)
#' @return implied volatility of a European Option appended (dataframe)
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
#' @seealso \code{EuropeanOptionImpliedVolatility}
#' @seealso \code{append_implied_volatility}
#' @export
#'

append_implied_volatility <- function(df,
                                      risk_free_rate = 0.01,
                                      initial_volatility_guess = 0.5) {
    for (i in 1:nrow(df)) {
        df[i, "ImpliedVolatility"] <- compute_implied_volatility(
            df[i, "Type"],
            df[i, "Value"],
            df[i, "Underlying"],
            df[i, "Strike"],
            df[i, "Maturity"],
            risk_free_rate,
            initial_volatility_guess
        )
    }
    return(df)
}

#'
#' Compute European Option Implied Volatility
#'
#' \code{compute_implied_volatility} returns the implied volatility of a European Option
#'
#' This function is a wrapper around the \code{EuropeanOptionImpliedVolatility}
#' function from the \code{RQUantLib} package. This function is used internally,
#' in this package, to compute a dataframe with implied volatitilies for each row.
#'
#' @param type One of the two values: 'call' or 'put' (string)
#' @param value Value of the option (number)
#' @param underlying Current price of the underlying (number)
#' @param strike Strike price of the option (number)
#' @param risk_free_rate Risk-free rate (number, default: 0.01)
#' @param maturity Time to maturity in fractional years (number)
#' @param initial_volatility_guess Initial guess for the volatility (number, default: 0.5)
#' @return implied volatility of a European Option (number)
#'
#' @author John Dole <jdoleiv@gmail.com>
#'
#' @details
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
#' @seealso \code{EuropeanOptionImpliedVolatility}
#' @importFrom RQuantLib EuropeanOptionImpliedVolatility
#' @export
#'

compute_implied_volatility <- function(
    type,
    value,
    underlying,
    strike,
    maturity,
    risk_free_rate = 0.01 ,
    initial_volatility_guess = 0.5) {
    dividend_yield <- 0
    return(as.numeric(
        EuropeanOptionImpliedVolatility(
            type,
            value,
            underlying,
            strike,
            dividend_yield,
            risk_free_rate,
            maturity,
            initial_volatility_guess
        )
    ))
}

