#' Aesop's Fables Tokens with Bing Sentiment Labels
#'
#' A token-level dataset of Aesop's Fables joined with the Bing Liu sentiment
#' lexicon. Each row represents a word from a fable that appears in the
#' Bing lexicon, labeled with binary sentiment polarity.
#'
#' The Bing lexicon classifies words as either \code{"positive"} or
#' \code{"negative"}, making this dataset useful for polarity-based
#' sentiment summaries and instructional demonstrations.
#'
#' @format A tibble with one row per token and sentiment match, containing:
#' \describe{
#'   \item{fable_id}{Character identifier for the fable}
#'   \item{title}{Title of the fable}
#'   \item{word}{Tokenized word from the fable text}
#'   \item{sentiment}{Binary sentiment label (\code{"positive"} or \code{"negative"})}
#' }
#'
#' @source
#' Bing Liu sentiment lexicon.
#'
#' @references
#' Hu, M., & Liu, B. (2004). *Mining and summarizing customer reviews*.
#' Proceedings of the ACM SIGKDD International Conference on Knowledge
#' Discovery and Data Mining.
#'
#' @seealso
#' \code{\link{aesops_tokens}}
#'
#' @usage data(aesops_bing)
#'
#' @docType data
#' @keywords datasets
"aesops_bing"
