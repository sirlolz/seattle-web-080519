class Performance

  attr_reader :date
  attr_accessor :musical, :theater

  @@all = [ ]

  def initialize(date, musical, theater)
    @date = date
    @musical = musical
    @theater = theater
    @@all << self
  end

  def self.all
    @@all
  end

  def hometown_setting?
    # !!Musical.all
    # true if perfomed in same city it is set
    # Musical setting_city && Theater city
      musical.setting_city == theater.city # ? true : false
    # false
  end

end
