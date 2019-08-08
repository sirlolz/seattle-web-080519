class Tweet
  attr_accessor :message
  attr_reader :user

  @@all = []
  def initialize(message, user)
    @message = message
    @user = user
    @@all << self
  end

  def self.all
    @@all
  end

  def username
    @user.username
  end

  def likes
    Like.all.select { |like| like.tweet == self }
  end

  def likers
    likes.map {|like| like.user}
  end
end
