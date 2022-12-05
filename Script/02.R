library(stringr)

beppe_posts <- str_extract_all(links, pattern= "^https://beppegrillo.it/.")