## API InstaLink.it

## TODO V1

  - [x] Build Posts
  - [x] Save in Image Upload in background
  - [x] Research/Create authentication (use Instagram to log in)
  - [x] Associate Posts with User
  - [X] Add settings (color, description, etc) to User
  - [X] Integrate Instagram Show
  - [x] Sign Up logic (jwt on swift ruby check if key exists, if not exist check if uid exists update auth token else create)

  - [ ] Research best creating multiple posts (create([{uid: }, {uid: }]))

## TODO V2
  - [ ] Benchmark Cached vs No Cache

## Short Link
  - A post has a short link
  - A user clicks on the short link
  - The link goes to a page and collects the users information and increments the clicks
  - The link permanently redirects to the long link



## Instalink Instagram Account
instalinkit


Reset heroku DB
heroku pg:reset DATABASE_URL

Create Subscription
Instagram.create_subscription('user', "https://instalink.ngrok.io/instagram/process_subscription", aspect = 'media')
