#' @title reddit_clean_dataframe()
#' This function returns a cleaned dataframe ready for sentiment analysis
#'
#' @param  input_url optional input, if you don't want to use the reddit_raw_dataframe function
#' @param dataframe a compatible dataframe that just neesd cleaning applied
#' @return a cleaned dataframe, 3 columns
#' @examples
#' reddit_clean_dataframe("https://www.reddit.com/r/funny/comments/7mjw12/my_cab_driver_tonight_was_so_excited_to_share/")
#' reddit_clean_dataframe(dataframe)
#' @name reddit_clean_dataframe

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

