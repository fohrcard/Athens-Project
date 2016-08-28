# API

#### Api Responses
success: `{response..}, status: 200`  
error: `{error_type: "error type", error_message: "some error description"}, status: 404`

## Authentication

#### Register/Sign Up
*Route* `POST /signup`  
*Params* `email=some@example.com&password=secret123`  
*Response* ``{token: "asldkjfalksdf.asfdasdlf.asdflksdjllk", user: {...}}``  

#### Sessions/Sign In
*Route* `POST /login`  
*Params* `email=some@example.com&password=secret123`  
*Response* ``{token: "asldkjfalksdf.asfdasdlf.asdflksdjllk", user: {...}}``
