CREATE EXTERNAL TABLE IF NOT EXISTS tweets_text(tweet_id STRING,in_reply_to_status_id STRING,in_reply_to_user_id STRING,tweet_timestamp STRING,source STRING,text STRING,retweeted_status_id STRING,retweeted_status_user_id STRING,retweeted_status_timestamp STRING,expanded_urls STRING) 
COMMENT 'Tweet Data'
ROW FORMAT DELIMITED
    FIELDS TERMINATED BY ','
    STORED AS TEXTFILE
    location '/user/admin/data/tweets';

CREATE TABLE IF NOT EXISTS tweets(
tweet_id STRING,
in_reply_to_status_id STRING,
in_reply_to_user_id STRING,
tweet_timestamp STRING,
source STRING,
text STRING,
retweeted_status_id STRING,
retweeted_status_user_id STRING,
retweeted_status_timestamp STRING,
expanded_urls STRING)
COMMENT 'Tweet Data in ORC Format'
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS ORC;

INSERT OVERWRITE TABLE tweets SELECT * FROM tweets_text;

CREATE EXTERNAL TABLE IF NOT EXISTS sentiment_dictionary(word STRING,rating STRING)
COMMENT 'sentiment dictionary'
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\t'
STORED AS TEXTFILE
location '/user/admin/data/sentiments';

CREATE TABLE words_array AS SELECT tweet_id AS id, split(text,' ') AS words FROM tweets;

CREATE TABLE tweet_word AS SELECT id AS id, word FROM words_array LATERAL VIEW explode(words) w as word;

CREATE TABLE word_join AS SELECT tweet_word.id, tweet_word.word, sentiment_dictionary.rating FROM tweet_word LEFT OUTER JOIN sentiment_dictionary ON (tweet_word.word=sentiment_dictionary.word);


