# Aesop's Fables Tokens with Bing Sentiment Labels

A token-level dataset of Aesop's Fables joined with the Bing Liu
sentiment lexicon. Each row represents a word from a fable that appears
in the Bing lexicon, labeled with binary sentiment polarity.

## Usage

``` r
data(aesops_bing)
```

## Format

A tibble with one row per token and sentiment match, containing:

- fable_id:

  Character identifier for the fable

- title:

  Title of the fable

- word:

  Tokenized word from the fable text

- sentiment:

  Binary sentiment label (`"positive"` or `"negative"`)

## Source

Bing Liu sentiment lexicon.

## Details

The Bing lexicon classifies words as either `"positive"` or
`"negative"`, making this dataset useful for polarity-based sentiment
summaries and instructional demonstrations.

## References

Hu, M., & Liu, B. (2004). \*Mining and summarizing customer reviews\*.
Proceedings of the ACM SIGKDD International Conference on Knowledge
Discovery and Data Mining.

## See also

[`aesops_tokens`](https://davidbrocker.github.io/aesopR/reference/aesops_tokens.md)
