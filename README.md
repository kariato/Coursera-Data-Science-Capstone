# Coursera-Data-Science-Capstone

Problem
Three keys for a successful application are:

+ Speed (The answer needs to be almost instantaneously to be useful)
+ Correct answer (The words and the probability need to make sense)
+ Visualization (Though the problem asked for only one word. The Ngram created an ordered result set that suited a word cloud plot)

#The key to this project is the NGRAM dataset
+ The importance of the Ngram data-set is key to the success of the application

+ It needs to be small enough that it can load into memory in a few seconds (two or less).

+ It needs to be less than 5MB in size since this is the maximum default for shiny application.

+ It needs to be comprehensive enough that it is useful about 900,000. So I limited it to top seven results for each n-gram and the response word must have at least three examples in the data set.

+ It needs to have offensive words and non ascii words removed since the source material is English.

+ The use of data.table with setkey improves searches to about a second giving reasonable response time.

+ The response needs to be ordered by how appropriate the suggestion is based on counts in training materials.

#Algorithm used to make the prediction
Algorithm used:

+ Modified BackOff which used a NGRAM the first three words used to look up the fourth for the suggestion.
Added fall back to previous words:

+ If first three words could not find a match, the I ignored the last word and looked at the previous word
A last chance data set

+ If the algorithm fails then I created a backup result set with the most common words
No need for two and three Ngram

+ I realized if the summed the data and made the results unique I need not build two and three Ngram saving memory and time.

#Using the Application
How to

Using Reactive Shiny text box means it updates as you type
Review the top word text box
Review the word cloud for multiple words
References
Primary reference: https://www.tidytextmining.com/tidytext.html
Application: https://kariato.shinyapps.io/NextWordCloud/
Presnetation: http://rpubs.com/kariato/355944
GitHub: https://github.com/kariato/Coursera-Data-Science-Capstone
