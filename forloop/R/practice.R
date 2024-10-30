#' Calculate column means of a data frame
#' 
#' This function takes a data frame as input and returns a vector of column means.
#' It ignores NA values.
#' @param df A data frame
#' @return A numeric vector of column means
#' @export
col_means <- function(df) {
  means <- numeric(ncol(df))
  for (i in seq_along(df)) {
    means[i] <- mean(df[[i]], na.rm = TRUE)
  }
  return(means)
}

#' Count NA values in a vector
#' 
#' This function counts the number of NA values in a vector.
#' @param vec A vector of any type
#' @return An integer count of NA values in the vector
#' @export
count_na <- function(vec) {
  na_count <- 0
  for (i in vec) {
    if (is.na(i)) {
      na_count <- na_count + 1
    }
  }
  return(na_count)
}
