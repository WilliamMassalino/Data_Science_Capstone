# Data_Science_Capstone
Repository for the Data Science Capstone Final Project from Coursera Data Science Specialization
# Next word prediction model using ANLP

This application was developed in 4 phases:

1. Data Preparation
2. Data Cleaning
3. Building model using N-Gram and Predictions using Backoff algorithm
4. Deployment on shiny server

# 1. Data preparation

Data is the key element of any artificial intelligence application. It is proven that “Data with good quality and quantity usually beats better algorithm”. Data gathering was not a difficult task as I used text data shared by SwiftKey on Coursera data science capstone.

About data: Data was collected from various sources like tweets, blogs and news It is having 4+ million lines and 100+ million words Data is in original form so there are many impurities in the data. Data cleaning has to be done before training a model.

# 2. Data Cleaning

Data cleaning is one of the major task and challenge in the area of NLP. Natural language can be written in many forms and everyone uses in different forms

Following transformations were applied to clean data:

* Remove non-English characters
* Remove punctuations
* Remove symbols and numbers
* Convert to lower case
* Replace contractions and abbreviations
* Remove text within brackets
* Remove profanity words

# 3. Building model using N-Gram and Predictions using Backoff algorithm

In the fields of computational linguistics and probability, an n-gram is a contiguous sequence of n items from a given sequence of text or speech.

I have generated from 1 to 3 gram models.

Backoff algorithm is used to predict next word based on previous N words.

* It will traverse last N-1 words in N-gram models until it matches. It returns the most probable 3 words which can be next word.
* If none of the last N-1 words matches with the N-gram models then it returns the most common 3 words from unigram model.

# 4. Deployment on shiny server

Shiny server is very useful to host data products built using R for free. It supports web design languages like HTML,CSS, JavaScript etc.

Next word prediction model as a data product:<https://williammassalino.shinyapps.io/Next_Word_Prediction_Model_Using_ANLP/>

