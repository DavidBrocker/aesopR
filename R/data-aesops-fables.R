#' Aesop's Fables Corpus
#'
#' A dataset containing 147 of Aesop's Fables retrieved from the
#' Library of Congress public domain collection.
#'
#' Each row represents a single fable and includes metadata,
#' the full narrative text, and the associated moral.
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
#' The texts were scraped from \url{https://read.gov/aesop/} and are
#' believed to be in the public domain. Text has been minimally cleaned
#' to preserve original phrasing and narrative structure.
#'
#' @source
#' Library of Congress, ``Aesop's Fables''
#'
#' @examples
#' aesops_fables
#'
#' aesops_fables |>
#'   dplyr::filter(fable_id == "075") |>
#'   dplyr::select(title, moral)
#'
#' @export
"aesops_fables"
