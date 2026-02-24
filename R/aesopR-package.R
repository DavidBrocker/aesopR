#' aesopR: Text Analysis of Aesop's Fables
#'
#' \pkg{aesopR} provides a tidy text corpus of Aesop's Fables sourced
#' from the Library of Congress, along with analysis-ready datasets for
#' exploring sentiment, emotion, and linguistic patterns in moral storytelling.
#'
#' The package is designed for teaching, research, and exploratory text analysis,
#' offering both raw narrative texts and tokenized data structures. It also
#' includes pre-joined sentiment datasets based on widely used lexicons to
#' support reproducible workflows without requiring interactive downloads.
#'
#' Core features include:
#' \itemize{
#'   \item A curated public-domain corpus of 147 Aesop's Fables
#'   \item Tidy tokenized representations for NLP workflows
#'   \item Pre-joined sentiment datasets using established lexicons (Bing, AFINN)
#' }
#'
#' @section Datasets:
#' \itemize{
#'   \item \link[aesopR]{aesops_fables}: Full fable texts and metadata
#'   \item \link[aesopR]{aesops_tokens}: Tokenized corpus for text analysis
#'   \item \link[aesopR]{aesops_afinn}: Tokens joined with AFINN sentiment scores
#'   \item \link[aesopR]{aesops_bing}: Tokens joined with Bing sentiment labels
#' }
#'
#' @author
#' Dave Brocker
#' @keywords internal
"_PACKAGE"


#' Aesop's Fables Corpus
#'
#' A dataset containing 147 of Aesop's Fables retrieved from the
#' Library of Congress public domain collection.
#'
#' Each row represents a single fable and includes metadata, the full narrative
#' text, and the associated moral.
#'
#' @format A tibble with 147 rows and the following variables:
#' \describe{
#'   \item{fable_id}{Character string uniquely identifying the fable
#'     (e.g., \code{"001"}, \code{"075"}).}
#'   \item{title}{Title of the fable.}
#'   \item{full_text}{Full narrative text of the fable.}
#'   \item{moral}{The moral or lesson associated with the fable.}
#'   \item{source_url}{URL of the original Library of Congress page.}
#' }
#'
#' @details
#' The texts were scraped from \url{https://read.gov/aesop/} and are believed to
#' be in the public domain. Text has been minimally cleaned to preserve original
#' phrasing and narrative structure.
#'
#' @source
#' Library of Congress, ``Aesop's Fables''
#'
#' @examples
#' aesops_fables
#'
#' if (requireNamespace("dplyr", quietly = TRUE)) {
#'   aesops_fables |>
#'     dplyr::filter(fable_id == "075") |>
#'     dplyr::select(title, moral)
#' }
#'
#' @export
"aesops_fables"


#' Tokenized Aesop's Fables
#'
#' A tidy token-level dataset derived from \link[aesopR]{aesops_fables}, where
#' each row represents a single word token from a fable.
#'
#' This dataset is intended for text analysis tasks such as sentiment analysis,
#' n-gram modeling, and word frequency analysis.
#'
#' @format A tibble with one row per word token and the following variables:
#' \describe{
#'   \item{fable_id}{Character string identifying the source fable.}
#'   \item{word}{Lowercase word token extracted from the fable text.}
#'   \item{word_count}{Total number of words in the source fable.}
#'   \item{source_url}{URL of the original fable text.}
#' }
#'
#' @details
#' Tokens were generated using \code{tidytext::unnest_tokens()}.
#' Stop words have not been removed, allowing users full flexibility in
#' preprocessing decisions.
#'
#' @seealso
#' \link[aesopR]{aesops_fables}
#'
#' @examples
#' aesops_tokens
#'
#' if (requireNamespace("dplyr", quietly = TRUE)) {
#'   aesops_tokens |>
#'     dplyr::count(word, sort = TRUE)
#' }
#'
#' @export
"aesops_tokens"
