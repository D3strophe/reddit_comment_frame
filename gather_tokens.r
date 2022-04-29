library(rvest)


# page <- read_html("https://www.reddit.com/r/dankmemes/new/")

# page %>% 
#  html_nodes("*") %>% 
#  html_attr("class") %>% 
#  unique()

# postTime <- page %>%
#  html_nodes("._3jOxDPIQ0KaOWpzvSQo-1s") %>%
#  html_text()

page <- read_html("https://www.reddit.com/r/funny")

postTime <- page %>%
  html_nodes("._3jOxDPIQ0KaOWpzvSQo-1s") %>%
  html_text()
