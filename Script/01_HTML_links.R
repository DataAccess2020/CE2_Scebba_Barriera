library(rvest)
library(tidyverse)

url_beppe_blog <- "https://beppegrillo.it/"
download.file(url_beppe_blog, destfile = here::here("beppeblog.html"))

# HTML_Second_try ---------

post_links <- read_html(here::here("beppeblog.html")) %>% 
  html_elements(css="div div")

