#' Plot emotion distribution across Aesop’s Fables
#'
#' Visualizes the frequency of NRC emotion categories across the full
#' Aesop’s Fables corpus.
#'
#' @return A ggplot object showing emotion counts.
#' @export
aesops_plot_emotion_distribution <- function() {

  data <- aesops_tokens |>
    dplyr::inner_join(
      tidytext::get_sentiments("nrc"),
      by = "word"
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
    ggplot2::geom_col(show.legend = FALSE) +
    ggplot2::coord_flip() +
    ggplot2::labs(
      x = NULL,
      y = "Number of emotion-associated words",
      title = "Emotion Distribution Across Aesops Fables"
    ) +
    ggplot2::theme_minimal() +
    ggplot2::theme(
      panel.grid = ggplot2::element_blank()
    )
}
