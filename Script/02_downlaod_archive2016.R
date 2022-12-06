library(rvest)
library(XML)
library(tidyverse)
library(httr)


url_archive <- "https://beppegrillo.it/category/archivio/2016/page/"


#creating a download_politely function

download_politely <- function(from_url, to_html , my_email, my_agent = R.Version()$version.string) {
  
require(httr)
  
  stopifnot(is.character(from_url))
  stopifnot(is.character(to_html))
  stopifnot(is.character(my_email))

req <- httr::GET(url = from_url,
                  add_headers(
                    From = my_email,
                    `User-Agent` = R.Version()$version.string
                  ))


if (httr::http_status(req)$message == "Success: (200) OK") {
  bin <- content(req, as = "raw")
  writeBin(object = bin, con = to_html)
  } else {
  cat("Houston, we have a problem!")
  }
}



#building the list of liks for each page

require(stringr)
links_2016 <- str_c("https://beppegrillo.it/category/archivio/2016/page/", 1:47) 
dir.create("post_2016")


#creating the loop for each page

for (i in seq_along(links_2016)) {
  cat(i, " ")
  
  download_politely(from_url = links_2016[i],
                    to_html = here::here("post_2016", str_c("page_",i,".html")),
                    my_email= "barrieragaia.uni@gmail.com")
  
  Sys.sleep(2)
}



