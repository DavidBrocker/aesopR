# NOT RUN

library(rvest)
library(ggplot2)
library(tidytext)
library(dplyr)
library(stringr)

# Load Source
stories <- paste0("https://read.gov/aesop/",sprintf("%03d", 2:147),".html")

# Helper Function to Download
aesop <- function(url) {

  aesop_url <- url |> read_html()

  tibble(
    title =
      aesop_url |>
      html_element("h1") |>
      html_text(),
    text =
      aesop_url |>
      html_elements("p") |>
      html_text() |>
      str_flatten(),
    moral =
      aesop_url|>
      html_element("blockquote") |>
      html_text()
  )

}

# Combine
aesop_fable <- map_df(stories, aesop)

# Core Data Set
aesops_fables <-
  aesop_fable |>
  mutate(
    word_count = str_count(text, "\\b\\w+\\b"),
    source_url = stories,
    fable_id = sprintf("%03d",2:147)
  ) |>
  rename(
    full_text = text
  ) |>
  relocate(fable_id, .before = title)

usethis::use_data(aesops_fables, overwrite = TRUE)

