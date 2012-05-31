## Serving up an API

After creating a service for your consumers, you will need to create an API for
those prosumers. Building a service is a great challenge.

In the previous exercise we built a client for an existing an API. Now we are
on the other side of the equation and we are going to build the serving side.

### Exercise

This week we are going to build a JSON service onto our existing simple Rails 
application.

A user should be able to visit their posts at the following URL:

```
http://localhost:3000/users/1/posts
```

Your goal is to add the support for JSON response at the following URL:

```
http://localhost:3000/users/1/posts.json
```

#### Goal

Visiting the path `posts.json` should return a JSON representation of all the 
user's posts.

```json
[ 
  { "user": "Ivan", 
    "message": "I have this message that I want to send",
    "posted": "2012-05-07 08:39:04 UTC" },
  { "user": "Ivan", 
    "message": "this is a post to twitter",
    "posted": "2012-05-07 08:32:04 UTC" }
]

```
