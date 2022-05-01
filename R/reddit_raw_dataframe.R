require(dplyr)
require(RedditExtractoR)

reddit_raw_dataframe <- function(input_url) {
  holding <- get_thread_content(urls = input_url)
  holding <- cbind.data.frame(holding$comments$timestamp, holding$comments$author, holding$comments$comment, holding$comments$score)
  
  return(holding)
}