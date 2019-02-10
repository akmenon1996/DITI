library(matrixStats)
library(tidyverse) 
library("SnowballC")
library("tm")
library("twitteR")
library("syuzhet")
library(ggplot2)
library(readr)
library(dplyr)
library(tidyr)
library(tidytext)
library(widyr)


songdata<-read.csv('songdata.csv')

songdata$text<-as.character(songdata$text)
song_lyrics <- as.vector(songdata$text) 
emotion <- get_nrc_sentiment(song_lyrics)
emotion <- as.matrix(emotion)
emotion <- colnames(emotion)[max.col(emotion,ties.method="first")]
emotion1 <- cbind(songdata,emotion)
head(emotion1)
write.csv(emotion1, file = "songsentiment.csv")
