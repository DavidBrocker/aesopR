# sentiment

## Why two lexicons?

aesopR ships with two sentiment-joined datasets so you can run sentiment
workflows immediately (and reproducibly) without triggering downloads or
interactive prompts:

- Bing: categorical labels (positive, negative)

- AFINN: numeric scores (e.g., -5 to +5)

These lexicons are bundled inside tidytext, which makes them lightweight
for teaching and safe for non-interactive environments (like automated
checks).

    library(aesopR)

A quick refresher: what’s in the sentiment datasets?

- aesops_bing

- aesops_bing

- aesops_afinn

- aesops_afinn

## Sentiment summaries across the entire corpus

Bing: overall counts

    table(aesops_bing$sentiment)

AFINN: overall score distribution

    summary(aesops_afinn$value)

*Teaching note: Ask students what it would mean for a fable to be
“positive” or “negative.” Is sentiment the same thing as a moral tone?
Often, not.*

## Which fables are “most positive” or “most negative”?

Bing: net sentiment per fable (positive minus negative)

    bing_tab <- with(
      aesops_bing,
      table(fable_id, sentiment)
    )

    # Some fables may not have both labels present; guard with checks
    pos <- if ("positive" %in% colnames(bing_tab)) bing_tab[, "positive"] else rep(0, nrow(bing_tab))
    neg <- if ("negative" %in% colnames(bing_tab)) bing_tab[, "negative"] else rep(0, nrow(bing_tab))

    bing_net <- pos - neg
    bing_net <- sort(bing_net)

    # Most negative
    head(bing_net, 10)

    # Most positive
    tail(bing_net, 10)

AFINN: mean score per fable

    afinn_mean <- tapply(aesops_afinn$value, aesops_afinn$fable_id, mean)
    afinn_mean <- sort(afinn_mean)

    # Lowest mean scores
    head(afinn_mean, 10)

    # Highest mean scores
    tail(afinn_mean, 10)

### Discussion prompts:

- Do Bing and AFINN “agree” on the extremes?

- What might explain disagreement?

- Are fables with “negative” language necessarily pessimistic?

## A story-driven deep dive: “The Fox and the Grapes”

Bing: which words are driving the sentiment?

    fox_bing <- aesops_bing |> filter(fable_id == "005")
    table(fox_bing$sentiment)

    # Most frequent negative/positive words in this fable
    sort(table(fox_bing$word[fox_bing$sentiment == "negative"]), decreasing = TRUE)[1:10]
    sort(table(fox_bing$word[fox_bing$sentiment == "positive"]), decreasing = TRUE)[1:10]

AFINN: strongest scored words

    fox_afinn <- aesops_afinn |> filter(fable_id == "005")
    summary(fox_afinn$value)

    afinn_ordered <- fox_afinn[order(fox_afinn$value), c("word", "value")]
    head(afinn_ordered, 8)
    tail(afinn_ordered, 8)

### Teaching note:

Invite students to read the moral and discuss whether “sentiment”
captures:

- the moral lesson

- the emotional arc

- the narrator’s perspective

- irony/rationalization (“sour grapes”)

## Extending to other lexicons (optional)

You can extend sentiment or emotion analysis using additional lexicons
in the tidytext/textdata ecosystem.

*Important practical note: Some lexicons (e.g., NRC) may require
textdata to download them on demand. This can trigger interactive
prompts in non-interactive environments (e.g., automated checks). For
this reason, aesopR ships with Bing and AFINN only, and treats other
lexicons as an optional extension.*

### Example: using another tidytext lexicon (if available)

This is an example pattern (not required for aesopR to work).

Some lexicons will be immediately available; others may require
textdata.

    if (requireNamespace("tidytext", quietly = TRUE)) { 
      # e.g., "loughran" is available via tidytext::get_sentiments() 
      # (designed for financial     contexts; included here to illustrate extension) 

    lex <- tidytext::get_sentiments("loughran") |> 
    head(lex) 
    }

If you plan to use lexicons that download through textdata, consider
doing so in an interactive session and caching results in your own
analysis project, rather than relying on on-demand downloads during
automated runs.

## Wrap-up: methods takeaways

These workflows are intentionally simple so they can serve as teaching
tools.

Key methods questions to emphasize:

- What does the lexicon measure?

- What does it not measure (context, negation, sarcasm, narrative
  framing)?

- How do pre-processing choices change results?

- What would validation look like (human coding, triangulation,
  sensitivity checks)?
