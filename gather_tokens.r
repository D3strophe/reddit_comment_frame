library(dplyr)
library(tm)
library(RedditExtractoR)

reddit_raw_dataframe <- function(input_url) {
  stopifnot(is.character(input_url) && is.logical(clean))
  
  holding <- get_thread_content(urls = input_url)
  holding <- cbind.data.frame(holding$comments$timestamp, holding$comments$author, holding$comments$comment, holding$comments$score)
  
  return(holding)
}

reddit_clean_dataframe <- function(dataframe) {
   dataset %>% rename("timestamp" = "holding$comments$timestamp", "commentor" = "holding$comments$author", "comment_content" = "holding$comments$comment", "upvotes" = "holding$comments$score") %>%
     mutate(comment_content = tolower(comment_content))
  
   dataset$comment_content <- removeWords(clean_df$comment_content, stopwords("en"))
   dataset$comment_content <- removeNumbers(clean_df$comment_content)
   dataset$comment_content <- removePunctuation(clean_df$comment_content)
   
   return(dataset)
}

# reddit_comments_dataframe <- function() {
# 
# }



dataset <- reddit_comments_dataframe("https://www.reddit.com/r/starcitizen/comments/ufuemg/317_has_made_star_citizen_feel_more_like_a_game/")

clean_df <- dataset %>% 
  rename("timestamp" = "holding$comments$timestamp", "commentor" = "holding$comments$author", "comment_content" = "holding$comments$comment", "upvotes" = "holding$comments$score") %>%
  mutate(comment_content = tolower(comment_content))
  
clean_df$comment_content <- removeWords(clean_df$comment_content, stopwords("en"))
clean_df$comment_content <- removeNumbers(clean_df$comment_content)
clean_df$comment_content <- removePunctuation(clean_df$comment_content)

