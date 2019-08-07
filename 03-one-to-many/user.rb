require 'pry'
class User
  attr_reader :username, :tweets

  @@all = [ ]

  def initialize(username)
    @username = username
    @tweets = []
    @@all << self
  end

  def self.all
    @@all
  end

  def post_tweet(message)
    tweet = Tweet.new(message, self)
    @tweets << tweet
    # binding.pry
  end
  # Don't need to do this if you are using macros
  # def username
  #   @username
  # end

end
