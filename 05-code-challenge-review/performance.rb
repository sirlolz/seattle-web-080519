class Performance

  attr_reader :date
  attr_accessor :musical_object, :theater

  @@all = [ ]

  def initialize(date, musical_object, theater)
    @date = date
    @musical_object = musical_object
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
