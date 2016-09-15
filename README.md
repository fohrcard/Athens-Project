# Set Up

```
# Clone app
git clone git@github.com:fohrcard/Athens-Project.git

# Install Ruby
rbenv install 2.3.1
or
rvm install 2.3.1

# Run bundler
bundle install

# Build Database
rails db:restart

# Run tests
rspec

# Build seed data
rails db:seed
```


# API Details

#### Api Responses
success: `{response..}, status: 200`  
error: `{error_type: "error type", error_message: "some error description"}, status: 404`

### Authentication

#### Register/Sign Up
*Route:* `POST /signup`  
*Params:*
```
{email: [username]@athens.com,
password: [Randomly Generated Password],  
password_confirmation: [Randomly Generated Password],
location: "[Country Code]",
age: "[Age Range]",
gender: "[Male or Female]"
}
```  
*Response:* ``{token: "asldkjfalksdf.asfdasdlf.asdflksdjllk", user_response}``  

#### Sessions/Sign In
*Route:* `POST /login`  
*Params:* `email=some@example.com&password=secret123`  
*Response:* ``{token: "asldkjfalksdf.asfdasdlf.asdflksdjllk", user_response}``


## Posts
#### Create
*Route:* `POST /post`  
*Params:* `image_one: asdfa, image_two: asdfa`  
*Response:* `post_response`

#### My Posts
*Route:* `GET /post`   
*Params:* n/a   
*Response:* `[post_response, post_response...]`

#### Vote
*Route:* `POST /post/:id/vote/:image_number`  
*Params:* n/a  
*Response:* `post_response`

#### Flag
*Route:* `POST /post/:id/flag`  
*Params:* n/a   
*Response:* `post_response`

##### Post Response

```
{
  id: int,  
  created_at: timestamp,
  user: {
    name: string,
    country: string
  }
  image_one: {
    url: string,
    percentage: float,
    total: int,
    lead: boolean
  },
  image_two: {
    url: string,
    percentage: float,
    total: int,
    lead: boolean
  },
  overall_voters: int
}
```

## Users

#### User Info
*Route:* `GET /user`
*Params:* n/a  
*Response:* `user_response`

#### Vote Requests
*Route:* `GET /user/requests`  
*Params:* n/a   
*Response:* `[post_response, post_response...]`

##### User Response
```
{
  name: string
  age: string
  country: string
  gender: string
  flags: int
  karma: string
}
```


# Todo
- [ ] Before launch only show posts that have been created in the past 24 hours for user and user/requests
