#BEWD_10 Midterm: Location Sentiment Checker

##Introduction
This is a simple Ruby program to check the sentiment of tweets in a given geographic area. The sentiment analysis uses the [AFINN wordlist](http://www2.imm.dtu.dk/pubdb/views/publication_details.php?id=6010) as a basis for sentiment scores. To accomplish this, it
- Loads the AFINN wordlist and term sentiment scores into a hash.
- Asks users for their location.
- Uses the `geocoder` gem to resolve the location into latatitude, longitude, and city values.
- Tells users where the geocoder belives them to be or, in the case of the geocoder not being able to resolve their location, asks if they'd like to attempt to enter their location again.
- Queries the Twitter search api using the user's latitude and longitue, parses the response JSON, and stores the text of each tweet in an array (`@parsed_tweets`).
- Scores each tweet by tokenizing the text field, and attempting to find each token in the sentiment hash; when tokens have a sentiment (postive or negative), that value is added to the total sentiment score for the query
- Tells users the score, and a brief explaination of what that score means.

##OAuth
OAuth tokens should be stored in a `.env` file, or the program will not work.

##Limitations
The Twitter Search API will only return 100 tweets per location query, so the dataset for any given query is probably too small to perform any meaningful analysis on. Because the dataset is so small, and because this program doesn't persist any values after it has run, it didn't seem worthwhile to attempt writing anything to derive the sentiment of terms that aren't already in the AFINN wordlist. While most locations I tried running it with returned negative sentiment values, I found there were some locations, including Los Angeles, usually returned positive sentiments. While I'm sure the algorithm for determining sentiment could be further tuned based on the prevalence of negative results, getting an accurate response didn't seem as important for this exercise as did getting the geocoder and Twitter search API to work correnctly, and parsing the response, than it did to get a robust sentiment analysis system working.