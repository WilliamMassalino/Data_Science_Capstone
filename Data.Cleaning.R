# Load Libraries

library("stringi")
library("tm")
library("ggplot2")
library("RWeka")

# Read en.us data

blogs.con <- file("en_US.blogs.txt","rb") 
blogs <- readLines(blogs.con, warn = FALSE, encoding = "UTF-8")
close(blogs.con)

news.con <- file("en_US.news.txt","rb")
news <- readLines(news.con, warn = FALSE, encoding = "UTF-8")
close(news.con)

twitter.con <- file("en_US.twitter.txt","rb")
twitter <- readLines(twitter.con, warn = FALSE, encoding = "UTF-8")
close(twitter.con)

blogs <- iconv(blogs, "latin1", "ASCII", sub="")
news <- iconv(news, "latin1", "ASCII", sub="")
twitter <- iconv(twitter, "latin1", "ASCII", sub="")

# Sample the data
# I first go ahead and remove all non-English characters and then go ahead and compile a sample dataset that is composed of 1% of each of the 3 original datasets.
set.seed(519)
sample_data <- c(sample(blogs, length(blogs) * 0.01),
                 sample(news, length(news) * 0.01),
                 sample(twitter, length(twitter) * 0.01))


# Create corpus

corpus <- VCorpus(VectorSource(sample_data))
corpus <- tm_map(corpus, tolower)
corpus <- tm_map(corpus, removePunctuation)
corpus <- tm_map(corpus, removeNumbers)
corpus <- tm_map(corpus, stripWhitespace)
corpus <- tm_map(corpus, PlainTextDocument)

# Remove profanity words
# Bad words collection has been taken from public source(Google)
bad.words <- readLines("bad_words.txt")
bad.words <- bad.words %>% tolower() %>% stripWhitespace()
corpus <- tm_map(corpus,removeWords,bad.words)

# I use the RWeka package to construct functions that tokenize the sample and construct matrices of uniqrams, bigrams, and trigrams.
uni_tokenizer <- function(x) NGramTokenizer(x, Weka_control(min = 1, max = 1))
bi_tokenizer <- function(x) NGramTokenizer(x, Weka_control(min = 2, max = 2))
tri_tokenizer <- function(x) NGramTokenizer(x, Weka_control(min = 3, max = 3))


uni_matrix <- TermDocumentMatrix(corpus, control = list(tokenize = uni_tokenizer))
bi_matrix <- TermDocumentMatrix(corpus, control = list(tokenize = bi_tokenizer))
tri_matrix <- TermDocumentMatrix(corpus, control = list(tokenize = tri_tokenizer))
# Then I find the frequency of terms in each of these 3 matrices and construct dataframes of these frequencies.

uni_corpus <- findFreqTerms(uni_matrix,lowfreq = 50)
bi_corpus <- findFreqTerms(bi_matrix,lowfreq=50)
tri_corpus <- findFreqTerms(tri_matrix,lowfreq=50)


uni_corpus_freq <- rowSums(as.matrix(uni_matrix[uni_corpus,]))
uni_corpus_freq <- data.frame(word=names(uni_corpus_freq), frequency=uni_corpus_freq)
bi_corpus_freq <- rowSums(as.matrix(bi_matrix[bi_corpus,]))
bi_corpus_freq <- data.frame(word=names(bi_corpus_freq), frequency=bi_corpus_freq)
tri_corpus_freq <- rowSums(as.matrix(tri_matrix[tri_corpus,]))
tri_corpus_freq <- data.frame(word=names(tri_corpus_freq), frequency=tri_corpus_freq)

saveRDS(uni_corpus_freq,file = "unigram.RDS")
saveRDS(bi_corpus_freq,file = "bigram.RDS")
saveRDS(tri_corpus_freq,file = "trigram.RDS")

write.csv(uni_corpus_freq,"unigram.csv",row.names = FALSE)
write.csv(bi_corpus_freq,"bigram.csv",row.names = FALSE)
write.csv(tri_corpus_freq,"trigram.csv",row.names = FALSE)

# Lastly, I will plot the Top 20 Unigrams, Bigrams and Trigrams most frequently words.

n <- 20L
# isolate top n words by decreasing frequency
top10_uni_corpus <- uni_corpus_freq[1:20,]
top10_bi_corpus <- bi_corpus_freq[1:20,]
top10_tri_corpus <- tri_corpus_freq[1:20,]
# reorder levels so charts plot in order of frequency
top10_uni_corpus$word <- reorder(top10_uni_corpus$word,top10_uni_corpus$frequency)
top10_bi_corpus$word <- reorder(top10_bi_corpus$word,top10_bi_corpus$frequency)
top10_tri_corpus$word <- reorder(top10_tri_corpus$word,top10_tri_corpus$frequency)

# Plots

plot_uni <- ggplot(top10_uni_corpus, aes(x = word, y = frequency))
plot_uni <- plot_uni + geom_bar(stat = "identity",colour="black",fill = "red") + coord_flip()+ ggtitle("Top 20 Unigrams") + 
  theme(plot.title = element_text(hjust = 0.5))+ geom_text(aes(label= frequency),hjust=-0.1)
plot_uni

plot_bi <- ggplot(top10_bi_corpus, aes(x = word, y = frequency))
plot_bi <- plot_bi + geom_bar(stat = "identity",colour="black",fill = "red") + coord_flip()+ ggtitle("Top 20 Bigrams") + 
  theme(plot.title = element_text(hjust = 0.5)) + geom_text(aes(label= frequency),hjust=-0.1)
plot_bi

plot_tri <- ggplot(top10_tri_corpus, aes(x = word, y = frequency))
plot_tri <- plot_tri + geom_bar(stat = "identity",colour="black",fill = "red") + coord_flip()+ ggtitle("Top 20 Trigrams") + 
  theme(plot.title = element_text(hjust = 0.5))+ geom_text(aes(label= frequency),hjust=-0.1)
plot_tri
