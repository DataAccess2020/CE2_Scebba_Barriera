library(rvest)
library(tidyverse)

url_beppe_blog <- "https://beppegrillo.it/"
download.file(url_beppe_blog, destfile = here::here("beppeblog.html"))