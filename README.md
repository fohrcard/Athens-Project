# API

#### Api Responses
success: `{response..}, status: 200`  
error: `{error_type: "error type", error_message: "some error description"}, status: 404`

## Authentication

#### Register/Sign Up
*Route:* `POST /signup`  
*Params:* `email=some@example.com&password=secret123&password_confirmation=secret123`  
*Response:* ``{token: "asldkjfalksdf.asfdasdlf.asdflksdjllk", user: {...}}``  

#### Sessions/Sign In
*Route:* `POST /login`  
*Params:* `email=some@example.com&password=secret123`  
*Response:* ``{token: "asldkjfalksdf.asfdasdlf.asdflksdjllk", user: {...}}``


## Posts
#### Create
*Route:* `POST /post`  
*Params:* `image_one: asdfa, image_two: asdfa`  
*Response:* `post`

#### My Posts
*Route:* `GET /post`   
*Params:* n/a   
*Response:* `[post, post, post]`

#### Vote
*Route:* `POST /post/id/vote/:image_number`  
*Params:* n/a  
*Response:* `post`

#### Vote Requests
*Route:* `GET /vote-requests`  
*Params:* n/a   
*Response:* `[post, post, post]`

#### Flag
*Route:* `POST /post/:id/flag`  
*Params:* n/a   
*Response:* `post`

##### Post Response

```
{post: {
  id: int,  
  created_at: timestamp,
  user: {
    name: string,
    country: string
  }
  img1: {
    url: string,
    percentage: int,
    lead: boolean
  },
  img2: {
    url: string,
    percentage: int,
    lead: boolean
  },
  overall_voters: int
}}
```

## Users

#### User Info
*Route:* `GET /user`
*Params:* n/a  
*Response:* `user`

##### User Response
```
{user: {
  name: string
  age: string
  country: string
  gender: string
  flags: int
  access_token: string
  karma: string
}}
```
