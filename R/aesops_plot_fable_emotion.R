#' Plot emotion distribution for a single Aesop's fable
#'
#' Creates a bar chart showing the number of words associated with each
#' NRC emotion category within a single Aesop's fable.
#'
#' @param fable_id A character string identifying the fable to plot.
#'   Must correspond to a valid \code{fable_id} in \code{aesops_fables}
#'   (e.g., \code{"075"}).
#'
#' @return A \code{ggplot} object displaying the raw count of
#'   emotion-associated words for the selected fable.
#'
#' @details
#' The plot uses the NRC sentiment lexicon and excludes the
#' \code{"positive"} and \code{"negative"} categories to focus on
#' discrete emotional dimensions (e.g., joy, fear, trust).
#'
#' @seealso
#' \code{\link{aesops_plot_fable_emotion_norm}}
#'
#' @examples
#' aesops_plot_fable_emotion("075")
#'
#' @export
aesops_plot_fable_emotion <- function(fable_id) {

  title =
    aesops_fables |>
    dplyr::filter(fable_id == !!fable_id) |>
    dplyr::pull(title) |>
    unique()

  subtitle =
    aesops_fables |>
    dplyr::filter(fable_id == !!fable_id) |>
    dplyr::pull(moral) |>
    unique()

  data <- aesops_tokens |>
    dplyr::filter(fable_id == !!fable_id) |>
    dplyr::inner_join(
      tidytext::get_sentiments("nrc"),
      by = "word",
      relationship = "many-to-many"
    ) |>
    dplyr::filter(
      !sentiment %in% c("positive", "negative")
    ) |>
    dplyr::count(sentiment, name = "n")

  ggplot2::ggplot(
    data,
    ggplot2::aes(
      x = reorder(sentiment, n),
      y = n,
      fill = sentiment
    )
  ) +
    ggplot2::geom_col(show.legend = FALSE, width = .7, color = "black") +
    ggplot2::coord_flip() +
    ggplot2::labs(
      x = NULL,
      y = "Number of emotion-associated words",
      title =
        paste0(
          "Emotion Distribution in Fable ",
          fable_id, ": ", title),
      subtitle =subtitle) +
    ggplot2::theme_minimal(paper = "#E6DDC5") +
    ggplot2::theme(
      panel.grid = ggplot2::element_blank(),
      plot.subtitle = ggplot2::element_text(face = "italic")
    )
}
