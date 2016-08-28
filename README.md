# API

#### Api Responses
success: `{response..}, status: 200`  
error: `{error_type: "error type", error_message: "some error description"}, status: 404`

## Authentication

#### Register/Sign Up
*Route* `POST /token/create`  
*Params* `email=some@example.com&password=secret123`  
*Response* ``{code: 200, token: "asldkjfalksdf.asfdasdlf.asdflksdjllk"}``  

#### Sessions/Sign In
*Route* `POST /token`  
*Params* `email=some@example.com&password=secret123`  
*Response* ``{code: 200, token: "asldkjfalksdf.asfdasdlf.asdflksdjllk"}``
