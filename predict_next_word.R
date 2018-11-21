# Load required libraries and functions
# For dataframe manipulations
library(dplyr)

# NLP library
library(tm)
library(qdap)

# UDF to predict the next word
source("predictions_funcs.R")

# For debugging purpose
isDebugMode = F

# Get ngram models for predictions
unigram.df = read.csv("unigram.csv",stringsAsFactors = F)
bigram.df = read.csv("bigram.csv",stringsAsFactors = F)
trigram.df = read.csv("trigram.csv",stringsAsFactors = F)

# List of all the models
modelsList = list(trigram.df,bigram.df,unigram.df)

# Predict the next work using backoff method
predict_Backoff("Guy at my table's wife got up to go to the bathroom and I asked about dessert and he started telling me about his",modelsList, isDebugMode = F)

saveRDS(modelsList,file = "modelsList.RDS")
