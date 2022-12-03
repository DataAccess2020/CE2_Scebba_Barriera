library(RCurl)
url <- "https://beppegrillo.it/un-mare-di-plastica-ci-sommergera/" 
email <- "barrieragaia.uni@gmail.com"
user_agent <- R.Version()$version.string

beppe_page <- RCurl::getURL(url=url, httpheader=c(from=email,
                                                 'User-Agent'= user_agent))