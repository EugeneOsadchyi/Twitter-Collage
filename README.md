# Twitter-Collage

[Demo](http://uturbo.pp.ua/)

##Setup

Make sure, that you have installed imagemagick:
<p><b>apt-get install imagemagick</b></p>

1. Add configuration file **config/settings/development.local.yml** with the next content:
```
  1 twitter:
  2   consumer_key: "<your_consumer_key>"
  3   consumer_secret: "<your_consumer_secret>"
  4   access_token: "<your_access_token>"
  5   access_token_secret: "<your_access_token_secret>"
  6 output_file:
  7   path: "<path_to_folder>"
  8   name: "<name_of_file>"
  9   format: ".jpg"
```  
2. Run **bundle install** to install missing gems
3. Run **rails server**

##Usage
1. **/tweets/twitter_user_name** - to get json with user tweets
2. **/collage/twitter_user_name** - to get collage of user's followers
  
  Options:
    - **cols** - number of avatars, horisontal (e.g. /collage/twitter_user_name?cols=5)
    - **rows** - number of avetars (vertical (e.g. /collage/twitter_user_name?rows=5)
