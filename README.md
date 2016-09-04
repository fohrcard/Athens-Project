# API

#### Api Responses
success: `{response..}, status: 200`  
error: `{error_type: "error type", error_message: "some error description"}, status: 404`

## Authentication

#### Register/Sign Up - X
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

#### Sessions/Sign In - X
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
*Route:* `POST /post/id/vote/:image_number`  
*Params:* n/a  
*Response:* `post_response`

#### Vote Requests
*Route:* `GET /vote-requests`  
*Params:* n/a   
*Response:* `[post_response, post_response...]`

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
  img1: {
    url: string,
    percentage: float,
    total: int,
    lead: boolean
  },
  img2: {
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
