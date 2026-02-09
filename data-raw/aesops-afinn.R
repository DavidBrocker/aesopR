source("data-raw/aesops-tokens.R")

library(tidytext)
library(dplyr)
library(purrr)

aesops_afinn <-
  aesops_tokens |>
  inner_join(get_sentiments("afinn"), by = join_by(word))

usethis::use_data(aesops_afinn, overwrite = TRUE)
