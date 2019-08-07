
## Review :
# One to Many Relationships

## SWBATs
* [ ] Implement one object to many objects relationship
  * [ ] One object `has many` objects
  * [ ] One object `belongs to` another object
* [ ] Practice passing custom objects as arguments to methods
* [ ] Demonstrate single source of truth
* [ ] Infer type of method (class or instance) through naming conventions
* [ ] Model/Domain

## Questions??????

## Deliverables
* Create a User class. The class should have these methods:
  * [ ] `initialize` which takes a username and have
  * [ ]  a reader method for the username
  * [ ] `tweets` that returns an array of Tweet instances
  * [ ] `#post_tweet` that take a message, creates a new tweet, and adds it to the user's tweet collection
  * [ ] `#tweets` -> tweets array.
* Create a Tweet class. The class should have these methods:
  * [ ] Have a mini breakout and see which methods would be instance vs class.
  * [ ] Tweet has a method `message` that returns a string
  * [ ] `#user` that returns an instance of the user class
  * [ ] `.all` that returns all the Tweets created
  * [ ] `#username` that returns the username of the tweet's user
