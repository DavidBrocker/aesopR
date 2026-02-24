# Tokenized Aesop's Fables

A tidy token-level dataset derived from
[aesops_fables](https://davidbrocker.github.io/aesopR/reference/aesops_fables.md),
where each row represents a single word token from a fable.

A tidy token-level dataset derived from `aesops_fables`, where each row
represents a single word token from a fable.

## Usage

``` r
aesops_tokens

aesops_tokens
```

## Format

A tibble with one row per word token and the following variables:

- fable_id:

  Character string identifying the source fable.

- word:

  Lowercase word token extracted from the fable text.

- word_count:

  Total number of words in the source fable.

- source_url:

  URL of the original fable text.

A tibble with one row per word token and the following variables:

- fable_id:

  Character string identifying the source fable.

- title:

  Title of the fable

- moral:

  The moral or lesson associated with the fable.

- word:

  Lowercase word token extracted from the fable text.

## Details

This dataset is intended for text analysis tasks such as sentiment
analysis, n-gram modeling, and word frequency analysis.

Tokens were generated using
[`tidytext::unnest_tokens()`](https://juliasilge.github.io/tidytext/reference/unnest_tokens.html).
Stop words have not been removed, allowing users full flexibility in
preprocessing decisions.

This dataset is intended for text analysis tasks such as sentiment
analysis, n-gram modeling, and word frequency analysis.

Tokens were generated using
[`tidytext::unnest_tokens()`](https://juliasilge.github.io/tidytext/reference/unnest_tokens.html).
Stop words have not been removed, allowing users full flexibility in
preprocessing decisions.

## See also

[aesops_fables](https://davidbrocker.github.io/aesopR/reference/aesops_fables.md)

[`aesops_fables`](https://davidbrocker.github.io/aesopR/reference/aesops_fables.md)

## Examples

``` r
aesops_tokens
#> # A tibble: 23,782 × 4
#>    fable_id title              moral                          word 
#>    <chr>    <chr>              <chr>                          <chr>
#>  1 002      The Frogs & the Ox Do not attempt the impossible. an   
#>  2 002      The Frogs & the Ox Do not attempt the impossible. ox   
#>  3 002      The Frogs & the Ox Do not attempt the impossible. came 
#>  4 002      The Frogs & the Ox Do not attempt the impossible. down 
#>  5 002      The Frogs & the Ox Do not attempt the impossible. to   
#>  6 002      The Frogs & the Ox Do not attempt the impossible. a    
#>  7 002      The Frogs & the Ox Do not attempt the impossible. reedy
#>  8 002      The Frogs & the Ox Do not attempt the impossible. pool 
#>  9 002      The Frogs & the Ox Do not attempt the impossible. to   
#> 10 002      The Frogs & the Ox Do not attempt the impossible. drink
#> # ℹ 23,772 more rows

if (requireNamespace("dplyr", quietly = TRUE)) {
  aesops_tokens |>
    dplyr::count(word, sort = TRUE)
}
#> # A tibble: 3,259 × 2
#>    word      n
#>    <chr> <int>
#>  1 the    1758
#>  2 a       785
#>  3 and     743
#>  4 to      719
#>  5 he      584
#>  6 of      468
#>  7 his     350
#>  8 in      332
#>  9 was     326
#> 10 you     280
#> # ℹ 3,249 more rows

aesops_tokens
#> # A tibble: 23,782 × 4
#>    fable_id title              moral                          word 
#>    <chr>    <chr>              <chr>                          <chr>
#>  1 002      The Frogs & the Ox Do not attempt the impossible. an   
#>  2 002      The Frogs & the Ox Do not attempt the impossible. ox   
#>  3 002      The Frogs & the Ox Do not attempt the impossible. came 
#>  4 002      The Frogs & the Ox Do not attempt the impossible. down 
#>  5 002      The Frogs & the Ox Do not attempt the impossible. to   
#>  6 002      The Frogs & the Ox Do not attempt the impossible. a    
#>  7 002      The Frogs & the Ox Do not attempt the impossible. reedy
#>  8 002      The Frogs & the Ox Do not attempt the impossible. pool 
#>  9 002      The Frogs & the Ox Do not attempt the impossible. to   
#> 10 002      The Frogs & the Ox Do not attempt the impossible. drink
#> # ℹ 23,772 more rows

aesops_tokens |>
  dplyr::count(word, sort = TRUE)
#> # A tibble: 3,259 × 2
#>    word      n
#>    <chr> <int>
#>  1 the    1758
#>  2 a       785
#>  3 and     743
#>  4 to      719
#>  5 he      584
#>  6 of      468
#>  7 his     350
#>  8 in      332
#>  9 was     326
#> 10 you     280
#> # ℹ 3,249 more rows
```
