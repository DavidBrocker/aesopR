![](reference/figures/logo.png)

## Overview

`aesopR` provides a tidy text corpus of public-domain *Aesop’s Fables*
sourced from the Library of Congress.  
The package includes full narrative texts and word-level representations
designed to support:

- Text analysis
- Sentiment analysis
- Linguistic exploration
- Teaching demonstrations
- Reproducible NLP workflows

The data are structured in a tidy format, making them immediately
compatible with the tidyverse ecosystem.

## Installation

You can install from CRAN:

``` r
install.packages("aesopR")
```

Or the development version from Github:

``` R
# install.packages("remotes")
remotes::install_github("DavidBrocker/aesopR")
```

## Included Datasets

### aesops_fables

A tibble containing 147 public-domain fables with: • fable_id • title •
full_text • moral • source_url

``` R
library(aesopR)

aesops_fables
```

### aesops_tokens

A tidy, word-level token dataset derived from aesops_fables.

Each row represents a single word token.

``` R
aesops_tokens

# Example:

if (requireNamespace("dplyr", quietly = TRUE)) {
  aesops_tokens |>
    dplyr::count(word, sort = TRUE)
}
```

## Pre-Joined Sentiment Datasets

The package also includes sentiment-enriched token datasets using
built-in tidytext lexicons: • aesops_afinn • aesops_bing

These datasets allow immediate sentiment exploration without external
downloads.

``` R
aesops_bing
aesops_afinn
```

## Example Workflow

``` R
library(aesopR)
library(dplyr)

# Most frequent words
aesops_tokens |>
  count(word, sort = TRUE) |>
  head(10)

# Sentiment summary using Bing
aesops_bing |>
  count(sentiment)
```

## Data Source

Texts were retrieved from:

Library of Congress <https://read.gov/aesop/>

All texts are believed to be in the public domain.

## Why aesopR?

Many NLP examples rely on song lyrics or copyrighted material. aesopR
provides a fully public-domain corpus suitable for:

- Classroom demonstrations

- Methods courses

- Sentiment tutorials

- Research reproducibility

- Package examples

License

MIT © Dave Brocker

Text corpus derived from public-domain sources.
