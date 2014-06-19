#Word Cloud script based on http://georeferenced.wordpress.com/2013/01/15/rwordcloud/

#Import packages tm aka TextMining and wordcloud 
library(tm)
library(wordcloud)
library(SnowballC)

#assign variable to datasource. NB 'mooncloud' is the name of the file.
mooncloud <- Corpus (DirSource("/Users/USERNAME/Documents/JFKMoonSpeech"))
#if manual can use inspect(mooncloud) to see if loaded

######### cleaning commands ##########
mooncloud <- tm_map(mooncloud, stripWhitespace) #Strips unnecessary whitespace
mooncloud <- tm_map(mooncloud, tolower) #convert to lowercase
mooncloud <- tm_map(mooncloud, removeWords, stopwords("english")) #removes conjunctions etc.
mooncloud <- tm_map(mooncloud, stemDocument) #remove suffixes for the common 'stem'
mooncloud <- tm_map(mooncloud, removePunctuation) #removes commas etc.

#arguments of 'tm' are converting the document to something other than text , to avoid, run this line
mooncloud <- tm_map(mooncloud, PlainTextDocument)

#Time to generate a wordcloud!
wordcloud(mooncloud
          , scale=c(5,0.5) #set the min and max scale
          , max.words=100 #set no. of words from the corpus to be plotted
          , random.order=FALSE #this plots in words in decreasing freq
          , rot.per=0.20 # % of vertical words
          , use.r.layout=FALSE #Uses C++ for collision detection
          , colors=brewer.pal(8, "Dark2")) #selects colour palette to be used 
