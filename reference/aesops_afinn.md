# Aesop's Fables Tokens with AFINN Sentiment Scores

A token-level dataset of Aesop's Fables joined with the AFINN sentiment
lexicon. Each row represents a word from a fable that appears in the
AFINN lexicon, along with its associated numeric sentiment score.

## Usage

``` r
data(aesops_afinn)
```

## Format

A tibble with one row per token and sentiment match, containing:

- fable_id:

  Character identifier for the fable

- title:

  Title of the fable

- moral:

  The moral or lesson associated with the fable.

- word:

  Tokenized word from the fable text

- value:

  AFINN sentiment score

## Source

AFINN sentiment lexicon by Finn Årup Nielsen (2011).

## Details

The AFINN lexicon assigns integer sentiment values ranging from negative
to positive polarity, making this dataset well-suited for aggregated
sentiment scoring and comparative analyses across fables.

## References

Nielsen, F. Å. (2011). \*A new ANEW: Evaluation of a word list for
sentiment analysis in microblogs\*. Proceedings of the ESWC Workshop on
Making Sense of Microposts.

## See also

[`aesops_tokens`](https://davidbrocker.github.io/aesopR/reference/aesops_tokens.md)
