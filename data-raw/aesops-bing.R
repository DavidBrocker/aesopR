source("data-raw/aesops-tokens.R")

library(tidytext)
library(dplyr)
library(purrr)

aesops_bing <-
  aesops_tokens |>
  inner_join(get_sentiments("bing"), by = join_by(word), relationship = "many-to-many")

usethis::use_data(aesops_bing, overwrite = TRUE)
