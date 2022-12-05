# Building the full list of links --------


require(stringr)

links_2016 <- str_c("https://beppegrillo.it/category/archivio/2016/", 1:47) %>% 
  paste0("/")

dir.create("post_2016")   

# creating a loop ------

url2 <- ("https://beppegrillo.it/category/archivio/2016/page/")

download.file(url="https://beppegrillo.it/category/archivio/2016", 
              destfile= here::here ("archive_2016.html"))
  

download_politely <- function(from_url, to_html , my_email, my_agent)

  
  
  
req <- httr:GET(url=url2,
                add_headers(
                  from=email,
                  'User-Agent'=user_agent
                ))

download_politely(from_url = url2,
                  to_html = here::here ("archive_2016.html"),
                  my_email= email)

for (i in seq_along(links_2016)) {
  cat(i, " ")
  
download_politely(from_url = links_2016[i],
                  to_html = here::here("post_2016", str_c()))
  Sys.sleep(2)
}

