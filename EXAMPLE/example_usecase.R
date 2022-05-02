library(RedditSentiment)
library(tidyverse)
library(tidytext)


# Source for below sentiment dictionaries 
# https://www.cs.uic.edu/~liub/FBS/sentiment-analysis.html

raw_positiveDictionary <- scan(file = "EXAMPLE/data/positive-words.txt", character(), quote = "")
raw_negativeDictionary <- scan(file = "EXAMPLE/data/negative-words.txt", character(), quote = "")
positiveDictionary <- raw_positiveDictionary[-c(1:174)]
negativeDicionary <- raw_negativeDictionary[-c(1:175)]

sentiment_frame <- reddit_clean_dataframe("https://www.reddit.com/r/PS5/comments/ufv81g/i_regret_buying_a_digital_ps5/")

comment_text_tokens <- sentiment_frame %>%
  unnest_tokens(word, comment_content) %>%
  count(word) %>%
  arrange(desc(n))

positive_df <- comment_text_tokens %>%
  filter(word %in% positiveDictionary)

negative_df <- comment_text_tokens %>%
  filter(word %in% negativeDicionary)