Coursera Data Science Capstone: Final Project Course 
========================================================
author: William Massalino

date: Wed Nov 21 12:59:43 2018


Predict the Next Word


Introduction
========================================================



<span style="color:blue; font-weight:bold; font-size:0.9em"> This presentation is created as part of the requirement for the Coursera Data Science Capstone Course. </span>


<font size="5">
The goal of the project is to build a predictive text model combined with a shiny app UI that will predict the next word as the user types a sentence similar to the way most smart phone keyboards are implemented today using the technology of Swiftkey.

*[Shiny App]* - [https://williammassalino.shinyapps.io/Next_Word_Prediction_Model_Using_ANLP/]

*[Github Repo]* - [https://github.com/WilliamMassalino/Data_Science_Capstone]

</font>


Getting & Cleaning the Data
========================================================

<span style="color:blue; font-weight:bold; font-size:0.7em">Before building the word prediction algorithm, data are first processed and cleaned as steps below:</span>

<font size="5">

- A subset of the original data was sampled from the three sources (blogs,twitter and news) which is then merged into one.
- Next, data cleaning is done by conversion to lowercase, strip white space, and removing punctuation and numbers.
- The corresponding n-grams are then created (Trigram, Bigram and Unigram).
- Next, the term-count tables are extracted from the N-Grams and sorted according to the frequency in descending order.

</font>


Word Prediction Model
========================================================
<span style="color:blue; font-weight:bold;font-size:0.7em">The prediction model for next word is based on the Katz Back-off algorithm. Explanation of the next word prediction flow is as below:</span>

<font size="5">

Backoff algorithm is used to predict next word based on previous N words.



- It will traverse last N-1 words in N-gram models until it matches. It returns the most probable 3 words which can be next word.


- If none of the last N-1 words matches with the N-gram models then it returns the most common 3 words from unigram model.


</font>


Deployment on shiny server
========================================================

<font size="5">



Shiny server is very useful to host data products built using R for free. It supports web design languages like HTML,CSS, JavaScript etc.

</font>



<span style="color:blue; font-weight:bold;font-size:0.em"> THANK YOU FOR YOUR TIME!!!
