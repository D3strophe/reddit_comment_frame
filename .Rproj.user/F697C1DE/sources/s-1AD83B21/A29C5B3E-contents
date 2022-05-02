library(tm)
library(tidyverse)


reddit_raw_dataframe <- function(input_url) {
  holding <- get_thread_content(urls = input_url)
  holding <- cbind.data.frame(holding$comments$timestamp, holding$comments$author, holding$comments$comment, holding$comments$score)
  
  return(holding)
}

reddit_clean_dataframe <- function(input_url, dataframe) {
  if(missing(input_url)) {
    dataset <- dataframe %>% rename("timestamp" = "holding$comments$timestamp", "commentor" = "holding$comments$author", "comment_content" = "holding$comments$comment", "upvotes" = "holding$comments$score") %>%
      mutate(comment_content = tolower(comment_content))
  } else {
    dataset <- reddit_raw_dataframe(input_url)
    dataset <- dataset %>% rename("timestamp" = "holding$comments$timestamp", "commentor" = "holding$comments$author", "comment_content" = "holding$comments$comment", "upvotes" = "holding$comments$score") %>%
      mutate(comment_content = tolower(comment_content))
  }
  dataset$comment_content <- removeWords(clean_df$comment_content, stopwords("en"))
  dataset$comment_content <- removeNumbers(clean_df$comment_content)
  dataset$comment_content <- removePunctuation(clean_df$comment_content)
  return(dataset)
}

