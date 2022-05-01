require(dplyr)
require(RedditExtractoR)
require(tm)

reddit_clean_dataframe <- function(input_url, dataframe) {
  if(missing(input_url)) {
    dataset <- dataframe %>% rename("timestamp" = "holding$comments$timestamp", "commentor" = "holding$comments$author", "comment_content" = "holding$comments$comment", "upvotes" = "holding$comments$score") %>%
      mutate(comment_content = tolower(comment_content))
  } else {
    dataset <- reddit_raw_dataframe(input_url)
    dataset <- dataset %>% rename("timestamp" = "holding$comments$timestamp", "commentor" = "holding$comments$author", "comment_content" = "holding$comments$comment", "upvotes" = "holding$comments$score") %>%
      mutate(comment_content = tolower(comment_content))
  }
  dataset$comment_content <- removeWords(dataset$comment_content, stopwords("en"))
  dataset$comment_content <- removeNumbers(dataset$comment_content)
  dataset$comment_content <- removePunctuation(dataset$comment_content)
  return(dataset)
}

