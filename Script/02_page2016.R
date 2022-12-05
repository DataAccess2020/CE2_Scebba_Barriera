# Building the full list of links --------


require(stringr)

links_2016 <- str_c("https://beppegrillo.it/category/archivio/2016/", 1:47)
dir.create("post_2016")   

# creating a loop ------

url2 <- ("https://beppegrillo.it/category/archivio/2016/")


for (i in seq_along(links_2016)) {
  cat(i, " ")
  
  RCurl::getURL(url=url2, httpheader=c(from=email,
                                      'User-Agent'= user_agent))
  Sys.sleep(2)
}