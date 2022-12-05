library(rvest)
library(XML)
library(tidyverse)
library(httr)


url_archive <- "https://beppegrillo.it/category/archivio/2016/"


download.file(url="https://beppegrillo.it/category/archivio/2016/", 
              destfile= here::here ("archive_2016.html"))


links_2016 <- str_c("https://beppegrillo.it/category/archivio/2016/page/", 1:47) 
links_2016



download_politely <- function(from_url, to_html , my_email, my_agent=R.Version()$version.string) {
  
  stopifnot(is.character(from_url))
  stopifnot(is.character(to_html))
  stopifnot(is.character(my_email))

req <- httr::GET(url = from_url,
                 add_headers(
                   From = email,
                   `User-Agent` = R.Version()$version.string
                 )
                 )


if (httr::http_status(req)$message == "Success: OK") {
  bin <- content(req, as = "raw")
  writeBin(object = bin, con = to_html)
} else {
  cat("Houston, we have a problem!")
}
}

download_politely(from_url= url_archive,
                  to_html = here::here("arc_2016"),
                  my_email=email)

dir.create("post_2016")


for (i in seq_along(links_2016)) {
  cat(i, " ")
  
  download_politely(from_url = links_2016[i],
                    to_html = here::here("post_2016", str_c("page",i,".html")),
                    my_email= email)
  
  Sys.sleep(2)
}




