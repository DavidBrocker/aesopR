# Aesop's Fables Corpus

A dataset containing 147 of Aesop's Fables retrieved from the Library of
Congress public domain collection.

A dataset containing 147 of Aesop's Fables retrieved from the Library of
Congress public domain collection.

## Usage

``` r
aesops_fables

aesops_fables
```

## Format

A tibble with 147 rows and the following variables:

- fable_id:

  Character string uniquely identifying the fable (e.g., `"001"`,
  `"075"`).

- title:

  Title of the fable.

- full_text:

  Full narrative text of the fable.

- moral:

  The moral or lesson associated with the fable.

- source_url:

  URL of the original Library of Congress page.

A tibble with 147 rows and the following variables:

- fable_id:

  Character string uniquely identifying the fable (e.g., `"001"`,
  `"075"`).

- title:

  Title of the fable.

- full_text:

  Full narrative text of the fable.

- moral:

  The moral or lesson associated with the fable.

- source_url:

  URL of the original Library of Congress page.

## Source

Library of Congress, “Aesop's Fables”

Library of Congress, “Aesop's Fables”

## Details

Each row represents a single fable and includes metadata, the full
narrative text, and the associated moral.

The texts were scraped from <https://read.gov/aesop/> and are believed
to be in the public domain. Text has been minimally cleaned to preserve
original phrasing and narrative structure.

Each row represents a single fable and includes metadata, the full
narrative text, and the associated moral.

The texts were scraped from <https://read.gov/aesop/> and are believed
to be in the public domain. Text has been minimally cleaned to preserve
original phrasing and narrative structure.

## Examples

``` r
aesops_fables
#> # A tibble: 146 × 6
#>    fable_id title                          full_text moral word_count source_url
#>    <chr>    <chr>                          <chr>     <chr>      <int> <chr>     
#>  1 002      The Frogs & the Ox             "An Ox c… Do n…        129 https://r…
#>  2 003      Belling the Cat                "The Mic… It i…        193 https://r…
#>  3 004      The Town Mouse & the Country … "A Town … Pove…        342 https://r…
#>  4 005      The Fox & the Grapes           "A Fox o… Ther…        141 https://r…
#>  5 006      The Wolf & the Crane           "A Wolf … Expe…        179 https://r…
#>  6 007      The Lion & the Mouse           "A Lion … A ki…        190 https://r…
#>  7 008      The Gnat & the Bull            "A Gnat … We a…         89 https://r…
#>  8 009      The Plane Tree                 "Two Tra… Our …         88 https://r…
#>  9 010      The Owl & the Grasshopper      "The Owl… Flat…        384 https://r…
#> 10 011      The Oak & the Reeds            "A Giant… Bett…        175 https://r…
#> # ℹ 136 more rows

if (requireNamespace("dplyr", quietly = TRUE)) {
  aesops_fables |>
    dplyr::filter(fable_id == "075") |>
    dplyr::select(title, moral)
}
#> # A tibble: 1 × 2
#>   title              moral               
#>   <chr>              <chr>               
#> 1 The Wolf & the Ass Stick to your trade.

aesops_fables
#> # A tibble: 146 × 6
#>    fable_id title                          full_text moral word_count source_url
#>    <chr>    <chr>                          <chr>     <chr>      <int> <chr>     
#>  1 002      The Frogs & the Ox             "An Ox c… Do n…        129 https://r…
#>  2 003      Belling the Cat                "The Mic… It i…        193 https://r…
#>  3 004      The Town Mouse & the Country … "A Town … Pove…        342 https://r…
#>  4 005      The Fox & the Grapes           "A Fox o… Ther…        141 https://r…
#>  5 006      The Wolf & the Crane           "A Wolf … Expe…        179 https://r…
#>  6 007      The Lion & the Mouse           "A Lion … A ki…        190 https://r…
#>  7 008      The Gnat & the Bull            "A Gnat … We a…         89 https://r…
#>  8 009      The Plane Tree                 "Two Tra… Our …         88 https://r…
#>  9 010      The Owl & the Grasshopper      "The Owl… Flat…        384 https://r…
#> 10 011      The Oak & the Reeds            "A Giant… Bett…        175 https://r…
#> # ℹ 136 more rows

aesops_fables |>
  dplyr::filter(fable_id == "075") |>
  dplyr::select(title, moral)
#> # A tibble: 1 × 2
#>   title              moral               
#>   <chr>              <chr>               
#> 1 The Wolf & the Ass Stick to your trade.
```
