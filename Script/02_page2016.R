# Building the full list of links --------


require(stringr)

links_2016 <- str_c("https://beppegrillo.it/category/archivio/2016/", 1:47) %>% 
  paste0("/")

dir.create("post_2016")   

# creating a loop ------

url2 <- ("https://beppegrillo.it/category/archivio/2016/page/")

download.file(url="https://beppegrillo.it/category/archivio/2016", 
              destfile= here::here ("archive_2016.html"))

install.packages("XML")
library(rvest)
library(XML)
library(tidyverse)

from_url <- "https://beppegrillo.it/category/archivio/2016"

download_politely <- function(from_url, to_html , my_email, my_agent=R.Version()$version.string) {
  require(httr)
  stopifnot(is.character(from_url))
  stopifnot(is.character(to_html))
  stopifnot(is.character(my_email))
simps_req <- httr::GET(url = from_url,
                 add_headers(
                   from = my_email,
                   `User-Agent`=R.Version()$version.string
                 )
)
if (httr::http_status(simps_req)$message == "Success: (200) OK") {
  bin <- content(simps_req, as = "raw")
  writeBin(object = bin, con = to_html)
} else {
  cat("Houston, we have a problem!")
}
}

download_politely(from_url = url2,
                  to_html = here::here ("archive_2016.html"),
                  my_email= email)

for (i in seq_along(links_2016)) {
  cat(i, " ")
  
  RCurl::getURL(url=url2, httpheader=c(from=email,
                                       'User-Agent'= user_agent))
  Sys.sleep(2)
}


