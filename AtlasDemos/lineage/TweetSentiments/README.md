# Simple Lineage Demo for Atlas

## Description 
This demo is to show the sentiment analysis of tweets. 

### Data
There are two datasets 
* Tweets - Bunch of tweets
* Sentiments - Words with associated entiment rating 

### Processing
The idea is to split the tweets into words and look up the words in sentiment rating data set to rate the tweets. 


## Install 

Run the following scripts in this order

IMPORTANT NOTE: Run scripts as root on Edge node.

```
bash ./scripts/install.sh

bash ./scripts/process-data.sh
```

