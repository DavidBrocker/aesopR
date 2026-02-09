#' Tokenized Aesop's Fables
#'
#' A tidy token-level dataset derived from \code{aesops_fables},
#' where each row represents a single word token from a fable.
#'
#' This dataset is intended for text analysis tasks such as
#' sentiment analysis, n-gram modeling, and word frequency analysis.
#'
#' @format A tibble with one row per word token and the following variables:
#' \describe{
#'   \item{fable_id}{Character string identifying the source fable.}
#'   \item{title}{Title of the fable}
#'   \item{moral}{The moral or lesson associated with the fable.}
#'   \item{word}{Lowercase word token extracted from the fable text.}
#' }
#'
#' @details
#' Tokens were generated using \code{tidytext::unnest_tokens()}.
#' Stop words have not been removed, allowing users full flexibility
#' in preprocessing decisions.
#'
#' @seealso
#' \code{\link{aesops_fables}}
#'
#' @examples
#' aesops_tokens
#'
#' aesops_tokens |>
#'   dplyr::count(word, sort = TRUE)
#'
#' @export
"aesops_tokens"
