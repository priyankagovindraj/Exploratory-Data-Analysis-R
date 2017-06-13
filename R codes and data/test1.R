library(ROAuth)
library(twitteR)
library(devtools)
library(streamR)
requestURL <- "https://api.twitter.com/oauth/request_token"
accessURL <- "https://api.twitter.com/oauth/access_token"
authURL <- "https://api.twitter.com/oauth/authorize"
custoken <- "SKEpKydZc1A77lta0QWsI1sZR"
cussecret <- "nfB8PKdaGqf86u20xsBkxWgU6Vt3AhegcdqUg6iJ6zjyZHrlgx"
my_oauth <- OAuthFactory$new(consumerKey=custoken,
                             consumerSecret=cussecret, requestURL=requestURL,
                             accessURL=accessURL, authURL=authURL)
my_oauth$handshake(cainfo = system.file("CurlSSL", "cacert.pem", package = "RCurl"))
save(my_oauth, file="oauth_token.Rdata")
load("oauth_token.Rdata")
filterStream(file.name = "C:\\Users\\PriyankaGovindraj\\Documents\\2nd sem\\DIC\\data1.json", track = c("presedential elections","Us elections", "#elections"),tweets = 100, oauth = my_oauth)



