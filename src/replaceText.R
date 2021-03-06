## This is a function that cleans the raw sentence or data

library(data.table)
library(tidyverse)
library(tidytext)
library(dplyr)
library(tm)
library(shiny)


replaceText <- function(sentence){
        
        sentence <- gsub("\\bcant\\b", "can not", sentence)
        sentence <- gsub("\\bwont\\b", "will not", sentence)
        sentence <- gsub("\\bshant\\b", "shall not", sentence)
        sentence <- gsub("\\baint\\b", "am not", sentence)
        # verb + negation (isn't, aren't, wasn't, etc.)
        sentence <- gsub("n't\\b", " not", sentence)
        sentence <- gsub("dnt\\b", "d not", sentence)
        
        # miscellaneous forms
        sentence <- gsub("\\blets\\b", "let us", sentence)
        sentence <- gsub("\\blet's\\b", "let us", sentence)
        sentence <- gsub("\\bc'mon\\b", "come on", sentence)
        sentence <- gsub("'n\\b", " and", sentence)
        # pronoun + verb
        sentence <- gsub("\\bim\\b", "i am", sentence)
        sentence <- gsub("\\bima\\b", "i am a", sentence)
        sentence <- gsub("'re\\b", " are", sentence)
        sentence <- gsub("'s\\b", " is", sentence)
        sentence <- gsub("'d\\b", " would", sentence)
        sentence <- gsub("'ll\\b", " will", sentence)
        sentence <- gsub("'ve\\b", " have", sentence)
    
        # Replace contractions with full words
        sentence <- gsub("\\bb\\b", "be", sentence)
        sentence <- gsub("\\bc\\b", "see", sentence)
        sentence <- gsub("\\bm\\b", "am", sentence)
        sentence <- gsub("\\bn\\b", "and", sentence)
        sentence <- gsub("\\bo\\b", "oh", sentence)
        sentence <- gsub("\\br\\b", "are", sentence)
        sentence <- gsub("\\bu\\b", "you", sentence)
        sentence <- gsub("\\by\\b", "why", sentence)
        sentence <- gsub("\\b1\\b", "one", sentence)
        sentence <- gsub("\\b2\\b", "to", sentence)
        sentence <- gsub("\\b4\\b", "for", sentence)
        sentence <- gsub("\\b8\\b", "ate", sentence)
        sentence <- gsub("\\b2b\\b", "to be", sentence)
        sentence <- gsub("\\b2day\\b", "today", sentence)
        sentence <- gsub("\\b2moro\\b", "tomorrow", sentence)
        sentence <- gsub("\\b2morow\\b", "tomorrow", sentence)
        sentence <- gsub("\\b2nite\\b", "tonight", sentence)
        sentence <- gsub("\\bl8r\\b", "later", sentence)
        sentence <- gsub("\\b4vr\\b", "forever", sentence)
        sentence <- gsub("\\b4eva\\b", "forever", sentence)
        sentence <- gsub("\\b4ever\\b", "forever", sentence)
        sentence <- gsub("\\bb4\\b", "before", sentence)
        sentence <- gsub("\\bcu\\b", "see you", sentence)
        sentence <- gsub("\\bcuz\\b", "because", sentence)
        sentence <- gsub("\\bcoz\\b", "because", sentence)
        sentence <- gsub("\\btnx\\b", "thanks", sentence)
        sentence <- gsub("\\btx\\b", "thanks", sentence)
        sentence <- gsub("\\btks\\b", "thanks", sentence)
        sentence <- gsub("\\bthks\\b", "thanks", sentence)
        sentence <- gsub("\\bthanx\\b", "thanks", sentence)
        sentence <- gsub("\\bu2\\b", "you too", sentence)
        sentence <- gsub("\\bur\\b", "your", sentence)
        sentence <- gsub("\\bgr8\\b", "great", sentence)
        sentence <- gsub("\\bk\\b", "ok", sentence)
        sentence <- gsub("\\brt\\b", "right", sentence)
        
        sentence <- gsub('[^A-z0-9[:space:]]',"", sentence)
        
        doc_ids <- c(1)
        sentence <- data.frame(doc_id = doc_ids, text = sentence, stringsAsFactors = FALSE)
        content2 = Corpus(DataframeSource(sentence))
        content2 = tm_map(content2, removeNumbers)
        #content2 = tm_map(content2, removeWords, stopwords('english'))
        content2 = tm_map(content2, removePunctuation)
        content2 = tm_map(content2, trimws)
        content2 = tm_map(content2, tolower)
        #content2 = tm_map(content2, PlainTextDocument)
        return(content2)
}
