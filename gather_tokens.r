library(rvest)
library(dplyr)


# page <- read_html("https://www.reddit.com/r/dankmemes/new/")

# page %>% 
#  html_nodes("*") %>% 
#  html_attr("class") %>% 
#  unique()

# postTime <- page %>%
#  html_nodes("._3jOxDPIQ0KaOWpzvSQo-1s") %>%
#  html_text()

page <- read_html("https://www.reddit.com/r/funny/comments/ufwkms/how_to_blow_on_a_turkey_call/")

nodes <- page %>% 
  html_nodes("*") %>% 
  html_attr("class") %>% 
  unique()

nodes

postTime <- page %>%
  html_nodes("._1VP69d9lk-Wk9zokOaylL") %>%
  html_text()