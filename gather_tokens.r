library(dplyr)
library(tm)
library(RedditExtractoR)

reddit_comments_dataframe <- function(input_url) {
  holding <- get_thread_content(urls = input_url)
  holding <- cbind.data.frame(holding$comments$timestamp, holding$comments$comment, holding$comments$score) 
  return(holding)
}

dataset <- reddit_comments_dataframe("https://www.reddit.com/r/starcitizen/comments/ufuemg/317_has_made_star_citizen_feel_more_like_a_game/")

#clean_df <- dataset %>%
  
  
