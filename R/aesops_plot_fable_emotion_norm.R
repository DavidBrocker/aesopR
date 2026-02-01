#' Plot normalized emotion distribution for a single Aesop's fable
#'
#' Creates a bar chart showing the proportion of emotion-associated
#' words attributed to each NRC emotion category within a single
#' Aesop's fable.
#'
#' @param fable_id A character string identifying the fable to plot.
#'   Must correspond to a valid \code{fable_id} in \code{aesops_fables}
#'   (e.g., \code{"075"}).
#'
#' @return A \code{ggplot} object displaying the normalized proportion
#'   of emotion-associated words for the selected fable.
#'
#' @details
#' Normalization is performed by dividing the count of words associated
#' with each emotion by the total number of emotion-associated words
#' in the fable. This allows comparison across fables of differing
#' lengths.
#'
#' The plot uses the NRC sentiment lexicon and excludes the
#' \code{"positive"} and \code{"negative"} categories.
#'
#' @seealso
#' \code{\link{aesops_plot_fable_emotion}}
#'
#' @examples
#' aesops_plot_fable_emotion_norm("075")
#'
#' @export
aesops_plot_fable_emotion_norm <- function(fable_id) {

  title <- aesops_fables |>
    dplyr::filter(fable_id == !!fable_id) |>
    dplyr::pull(title) |>
    unique()

  subtitle <- aesops_fables |>
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
    dplyr::count(sentiment, name = "n") |>
    dplyr::mutate(
      prop = n / sum(n)
    )

  ggplot2::ggplot(
    data,
    ggplot2::aes(
      x = reorder(sentiment, prop),
      y = prop,
      fill = sentiment
    )
  ) +
    ggplot2::geom_col(show.legend = FALSE) +
    ggplot2::coord_flip() +
    ggplot2::scale_y_continuous(labels = scales::percent_format()) +
    ggplot2::labs(
      x = NULL,
      y = "Proportion of emotion-associated words",
      title = paste0("Normalized Emotion Distribution in Fable ", fable_id, ": ", title),
      subtitle = subtitle
    ) +
    ggplot2::theme_minimal() +
    ggplot2::theme(
      panel.grid = ggplot2::element_blank(),
      plot.subtitle = ggplot2::element_text(face = "italic")
    )
}
