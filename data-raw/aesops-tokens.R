source("data-raw/aesops-fables.R")


stopifnot(exists("aesops_fables"))
# Tokenized Data Set --------------------------------------------------------------------------
aesops_tokens <-
  aesops_fables |>
  select(-word_count,-source_url) |>
  unnest_tokens(word,full_text)

usethis::use_data(aesops_tokens, overwrite = TRUE)
