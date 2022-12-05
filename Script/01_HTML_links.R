library(rvest)
library(tidyverse)

url_beppe_blog <- "https://beppegrillo.it/un-mare-di-plastica-ci-sommergera/"
download.file(url, destfile = here::here("beppeblog.html"))

library(XML)

links <- XML::getHTMLLinks(doc= beppe_page, externalOnly = T, relative = F)

links2 <- tibble(links)

# Post links ------------
library(stringr)

beppe_posts <- str_extract_all(links, pattern= "^https://beppegrillo.it/.")
