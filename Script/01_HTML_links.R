library(rvest)
library(tidyverse)

url_beppe_blog <- "https://beppegrillo.it/un-mare-di-plastica-ci-sommergera/"
download.file(url, destfile = here::here("beppeblog.html"))

links <- read_html(here::here("beppeblog.html")) %>%
  html_elements(css = "a")%>% 
  html_text(trim = TRUE)

links2 <- as_tibble(links)

library(stringr)

posts_link <- str_view_all(links2, pattern= "https://beppegrillo.it/.")