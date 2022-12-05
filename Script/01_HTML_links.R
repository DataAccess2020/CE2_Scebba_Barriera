library(rvest)
library(tidyverse)

url_beppe_blog <- "https://beppegrillo.it/un-mare-di-plastica-ci-sommergera/"
download.file(url, destfile = here::here("beppeblog.html"))

links <- read_html(here::here("beppeblog.html")) %>% 
  html_elements(css = "a")