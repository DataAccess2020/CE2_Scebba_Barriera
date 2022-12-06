library(rvest)
library(XML)
library(tidyverse)
library(httr)

#scraping the main text for each page 

scrape <- list.files(here::here("post_2016"), full.names = TRUE)

all_pages <- vector(mode = "list", length = length(scrape))

for (i in seq_along(all_pages)){
  all_pages[[i]] <- read_html(scrape[i]) %>%
    html_elements(css = ".td-excerpt") %>%
    html_text(trim = TRUE)
}

all_pages[[1]]