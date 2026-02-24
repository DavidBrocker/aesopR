# Getting started

## **What is aesopR?**

aesopR provides a tidy, public-domain corpus of *Aesop’s Fables* sourced
from the Library of Congress.

It is designed for teaching, exploration, and reproducible text analysis
workflows—without relying on copyrighted text.

The package ships with:

- aesops_fables: one row per fable (text + metadata)

- aesops_tokens: one row per word token (analysis-ready)

- aesops_bing: tokens joined with Bing sentiment labels

- aesops_afinn: tokens joined with AFINN sentiment scores

In this vignette, we’ll use one fable as a running example: **“The Fox
and the Grapes.”**

    library(aesopR)

## **The core datasets**

### **aesops_fables**

### **full texts and metadata**

aesops_fables contains the fables as complete narratives, along with a
moral and a source URL.

    aesops_fables

### **aesops_tokens**

### **tidy word-level data**

aesops_tokens is derived from the fable texts and is ready for word
frequency, n-grams, and sentiment workflows.

    aesops_tokens

## **Find “The Fox and the Grapes”**

    fox_text <- aesops_fables |> filter(fable_id == "005")
    fox_text

## **Token-based exploration**

Once you have a fable_id, you can pull its word tokens.

    fox_tokens <-  aesops_tokens |> filter(fable_id == "005")
    head(fox_tokens)

### **Most common words in this fable**

    fox_tokens |> count(word, sort = TRUE)

This is intentionally simple. In a methods class, this is a great moment
to discuss:

- stop words

- lemmatization/stemming

- how preprocessing choices influence results

## **Sentiment datasets (no external downloads)**

To avoid interactive prompts and downloads during checks, aesopR ships
with two sentiment-joined datasets:

- aesops_bing (positive/negative labels)

- aesops_afinn (numeric sentiment scores)

### **Bing sentiment: positive vs negative counts**

    fox_bing <- aesops_bing |> filter(fable_id == "005")
    table(fox_bing$sentiment)

### **AFINN sentiment: summary of scores**

    fox_afinn <- aesops_afinn |> filter(fable_id == "005")
    summary(fox_afinn$value)

A nice discussion prompt:

- Do the sentiment signals match the *moral* of the story?

- What words are driving the sentiment?

- How might results change with a different lexicon?

## **Where to go next**

If you’re teaching or learning research methods, aesopR works well for:

- operational definitions (what counts as a “theme”?)

- measurement decisions (lexicon choice, preprocessing choices)

- replication and transparency (same corpus, different pipelines)

- quick classroom activities (frequency, sentiment, moral inference)
