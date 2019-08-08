require 'pry'
class User
  # Don't need to do this if you are using macros
  # def username
  #   @username
  # end

  attr_reader :username, :tweets

  @@all = [ ]

  def initialize(username)
    @username = username
    # @tweets = []
    @@all << self
  end

  def self.all
    @@all
  end

  def post_tweet(message)
    Tweet.new(message, self)
    # @tweets << tweet
    # binding.pry
  end

  def tweets
    # binding.pry
    Tweet.all.select {|tweet| tweet.user == self }
  end

  def like_tweet(tweet)
    Like.new(tweet, self)
  end

  def likes
    Like.all.select { |like| like.user == self }
  end

  def liked_tweets
    likes.map {|like| like.tweet}
  end

end
