# HTTP Requests

1.  What are some common HTTP status codes?

* 200 - OK.  The request was successful,
* 304 - Not Modified.  The resource was not modified because the client had already downloaded it.
* 307 - Temporary Redirect.  The resource is located at another URL.
* 404 - Not Found.  The resource was not found.

2.  What is the difference between a GET request and a POST request? When might each be used?

GET and POST are different ways of attaching parameters to an HTTP request as name/value pairs.  In the get method, the parameters are included as part of the URL.  (For example, search/?name=value).

In the POST method, the parameters are included in the message part of the request.

Generally, the POST method is preferred because it is more secure and allows for more data types.  POST is essential for any type of sensitive information (like passwords) that needs to be kept out of the URL.

3.  What is a cookie (the technical kind, not the delicious kind)? How does it relate to HTTP requests?

A cookie is a piece of permanent data that can be stored on a client computer.  It can be used to allow a website to store information about the current state (for example, whether the used is logged in).

A cookie can be created using the Set-Cookie HTTP header.  Once stored, a cookie is returned to the server as part of every HTTP request sent by the client.