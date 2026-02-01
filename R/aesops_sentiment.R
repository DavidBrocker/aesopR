#' Join Aesop's Fables tokens with sentiment lexicons
#'
#' @param method Sentiment lexicon to use.
#'
#' @return A tibble of tokens joined with sentiment values.
#' @export
aesops_sentiment <- function(method = c("bing", "afinn", "loughran", "nrc")) {

  method <- match.arg(method)

  aesops_tokens |>
    dplyr::inner_join(
      tidytext::get_sentiments(method),
      by = "word",
      relationship = "many-to-many"
    )
}
