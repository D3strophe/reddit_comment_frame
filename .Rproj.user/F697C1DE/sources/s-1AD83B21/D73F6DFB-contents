#' @title reddit_raw_dataframe()
#' Gather unclean reddit comments
#' 
#' @param input_url string url of comment thread
#' @return A raw dataframe, with comments, timestamp, and upvote score
#' @example 
#' reddit_raw_dataframe("https://www.reddit.com/r/funny/comments/7mjw12/my_cab_driver_tonight_was_so_excited_to_share/")
#' @name reddit_raw_dataframe

require(dplyr)
require(RedditExtractoR)

reddit_raw_dataframe <- function(input_url) {
  holding <- get_thread_content(urls = input_url)
  holding <- cbind.data.frame(holding$comments$timestamp, holding$comments$author, holding$comments$comment, holding$comments$score)
  
  return(holding)
}