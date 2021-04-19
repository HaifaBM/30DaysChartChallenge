# Loading the packages
library("tm")
library("SnowballC")
library("wordcloud2")
library("RColorBrewer")


# Reading the txt File
filePath <- "C:/Users/Haifa.Benmessaoud/Desktop/physical.txt"
text_Y <- readLines(filePath)
corpus <- iconv(text_Y, to = "UTF-8")

# Loading the data in a corpus
docs <- Corpus(VectorSource(corpus))
inspect(docs)
toSpace <- content_transformer(function (x , pattern ) gsub(pattern, " ", x))
docs <- tm_map(docs, toSpace, "/")
docs <- tm_map(docs, toSpace, "@")
docs <- tm_map(docs, toSpace, "\\|")

docs2 <- Corpus(VectorSource(corpus2))
inspect(docs2)
toSpace <- content_transformer(function (x , pattern ) gsub(pattern, " ", x))
docs2 <- tm_map(docs2, toSpace, "/")
docs2 <- tm_map(docs2, toSpace, "@")
docs2 <- tm_map(docs2, toSpace, "\\|")

## The Yes answers 
# Convert letter to lower 
docs <- tm_map(docs, content_transformer(tolower))
# Deleting numbers 
docs <- tm_map(docs, removeNumbers)
# Deleting the stopwords 
docs <- tm_map(docs, removeWords, stopwords("english"))
#Deleting the punctuation
docs <- tm_map(docs, removePunctuation)
# Deleting the stripwhiespace
docs <- tm_map(docs, stripWhitespace)

# Creating the matrix for the word cloud of the No
dtm <- TermDocumentMatrix(docs)
m <- as.matrix(dtm)
v <- sort(rowSums(m),decreasing=TRUE)
d <- data.frame(word = names(v),freq=v)
head(d, 10)

set.seed(1234)
wordcloud2(d, color="random-light", backgroundColor="#E0BBE4",minRotation = -pi/4, maxRotation = -pi/4, shape = 'circle',ellipticity = 0.65,fontFamily = 'mono', fontWeight = 'bold')
