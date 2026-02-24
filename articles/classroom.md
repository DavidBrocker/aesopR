# classroom

## **Teaching with a public-domain corpus**

Aesop’s fables are short, narrative, and structured around morals—which
makes them unusually good for research methods teaching:

- **Operationalization:** “What counts as sentiment?” “What counts as a
  theme?”

- **Measurement decisions:** Tokenization, stop words, lexicon choice

- **Transparency & replication:** Same corpus, different pipelines,
  different conclusions

- **Critical thinking:** What do methods *miss* in moral storytelling?

We’ll use one fable as a running example: **“The Fox and the Grapes.”**

    library(aesopR)

## **Helper: pick the fable (“Fox and the Grapes”)**

    fox_rows <- grepl("fox", aesops_fables$title, ignore.case = TRUE) &
      grepl("grape", aesops_fables$title, ignore.case = TRUE)

    fox_grapes <- aesops_fables[fox_rows, ]
    fox_grapes[, c("fable_id", "title", "moral")]

    fable_id <- fox_grapes$fable_id[1]
    fable_id

------------------------------------------------------------------------

## **Activity 1: “Guess the moral” from partial evidence**

**Goal:** Show how conclusions depend on what evidence you allow
yourself to see.

**Setup (5 minutes):**

1.  Give students only the *title* and the top 10–15 words.

2.  Ask them to write a one-sentence “predicted moral.”

3.  Then reveal the full moral and discuss mismatches.

### **Instructor code: top words**

    fox_tokens <- aesops_tokens |> filter(fable_id == "005")
    top_words <- fox_tokens |> count(word,sort = TRUE) |> slice_head(n = 10)
    top_words

**Prompt (students):**

- Based on the title and these words, what do you think happens?

- What do you think the moral is?

- What words might be misleading?

**Discussion points:**

- Frequency ≠ importance

- Stop words and narrative function words

- “Theme inference” is not purely mechanical

## **Activity 2: “Methods as measurement” (lexicon comparison)**

**Goal:** Demonstrate that measurement depends on instrument choice
(lexicon choice).

**Quick prompt (students):**

- Do these methods agree about whether the fable is “positive” or
  “negative”?

- What kinds of words do they treat as meaningful?

### **Bing sentiment counts**

    fox_bing <- aesops_bing |> filter(fable_id == "005")
    table(fox_bing$sentiment)

### **AFINN score summary**

    fox_afinn <- aesops_afinn |> filter(fable_id == "005")
    summary(fox_afinn$value)

### **Identify sentiment-driving words (simple)**

    # Bing: which words appear most in each label?
    sort(table(fox_bing$word[fox_bing$sentiment == "negative"]), decreasing = TRUE)[1:10]
    sort(table(fox_bing$word[fox_bing$sentiment == "positive"]), decreasing = TRUE)[1:10]

    # AFINN: strongest positive/negative words
    afinn_ordered <- fox_afinn[order(fox_afinn$value), c("word", "value")]
    head(afinn_ordered, 8)
    tail(afinn_ordered, 8)

**Discussion points:**

- Lexicons were built for different purposes

- Context blindness (sarcasm, negation, narrative framing)

- Reliability/validity analogy: lexicon as “instrument”

## **Activity 3: “Operational definitions” (what counts as a construct?)**

**Goal:** Have students define a construct (e.g., “frustration” or
“self-justification”)

and propose a text-based operationalization.

**Small-group task (10–15 minutes):**

Pick one construct and propose:

1.  An operational definition in plain language

2.  A rule-based measurement plan using tokens/sentiment

3.  A limitation statement

**Example constructs:**

- Frustration

- Perseverance

- Envy

- Self-justification (“sour grapes”)

- Rationalization

### **Instructor code: create simple “dictionary” counts**

Below is a simple, transparent “dictionary method” that students can
critique.

    # Tiny hand-built dictionary (edit in-class)
    rationalization_terms <- c("couldn't", "cannot", "never", "worth", "sour", "fine")

    # Count dictionary hits
    sum(fox_tokens$word %in% tolower(rationalization_terms))

**Prompt (students):**

- Are these terms reasonable indicators?

- What false positives/negatives might occur?

- How would you improve the dictionary?

**Discussion points:**

- Face validity vs construct validity

- Researcher degrees of freedom

- Pre-registration and transparency

``` r
devtools::document()
devtools::check()
pkgdown::build_site()
```
