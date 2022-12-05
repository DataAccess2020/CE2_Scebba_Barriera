# Building the full list of links --------


require(stringr)

links_2016 <- str_c("https://beppegrillo.it/category/archivio/2016/", 1:47)
dir.create("post_2016")   
