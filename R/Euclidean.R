#' Implementation of Greatest Common Divisor using Euclidean Algorithm
#'
#' This function calculates the greatest common divisor of two input integers
#'
#' @param i an integer
#' @param j an integer
#'
#' @details
#' - If both inputs are zero, the GCD is undefined and an error is raised.
#' - If one input is zero, the GCD is the absolute value of the other input.
#' - Negative inputs are allowed; the result is always returned as a positive integer.
#'
#' @examples
#' euclidean(120, 25) # Returns 5
#' euclidean(123612, 13892347912) # Returns 4
#' euclidean(0, 0) # Returns error
#' euclidean(0, 12) # Returns 12
#'
#' @export

euclidean <- function(i, j){
  if(!is.numeric(i) || !is.numeric(j) ||
      length(i) != 1 || length(j) != 1 ||
       i %% 1 != 0 || j %% 1 != 0){
    stop("Input numbers should be numeric scalar or integer")
  }

  if (i == 0 && j == 0)
    stop("Both numbers are not defined")

  i <- abs(i)
  j <- abs(j)

  if (i == 0) return(j)
  if (j == 0) return(i)

  x <- max(i, j)
  y <- min(i, j)

  repeat{
    rem <- x %% y

    if (rem == 0){
      break
    }
    else {
      x <- y
      y <- rem
    }
  }
  return(y)
}
