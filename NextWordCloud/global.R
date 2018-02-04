library(data.table)
library(wordcloud)
library(dplyr)

#clean up
rm(list=ls())

#load the ngram to search
load("ngramReduced.Rda")

#load default words if nothing found
load("starter.Rda")

#start with default word
result <- x

#function highly modified backoff using 4 ngram but reducing to 3 and 2 using the same ngram
answerNgramV2 <- function(dt, text) {
  x <- unlist(rev(tstrsplit(text, " ")))
  y <- dt[word3 == x[1] & word2 == x[2] & word1 == x[3]]
  if (count(y) == 0) {
    y <- dt[word3 == x[1] & word2 == x[2]]
  }
  
  if (count(y) == 0) {
    y <- dt[word3 == x[1]]
  }
  if (count(y) == 0) {
    y <- dt[word2 == x[1] & word1 == x[2]]
  }
  if (count(y) == 0) {
    y <- dt[word2 == x[1]]
  }
  if (count(y) == 0) {
    y <- dt[word1 == x[1]]
  }
  if (count(y) == 0) {
    y <- head(dt[order(-COUNT)], 20)
  }
  y[, word1 := NULL]
  y[, word2 := NULL]
  y[, word3 := NULL]
  y <- y[, COUNT := sum(COUNT), by = suggestion]
  setkey(y, "suggestion", "COUNT")
  y = unique(y)
  head(y[order(-COUNT)], 20)
}

#Get the top word
getTextAnswer <- function(searchText) {
  if (nchar(trimws(searchText))==0)
  {
    result <- x
  }
  else
  {
    result <- answerNgramV2(reduceDT,trimws(searchText))
  }
  head(result$suggestion,1)
}

#get the result words
getCloudAnswer <- function(searchText) {
  if (nchar(trimws(searchText))==0)
  {
    result <- x
  }
  else
  {
    result <- answerNgramV2(reduceDT,trimws(searchText))
  }
  result
}
