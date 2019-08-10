class Theater

  attr_reader :title, :city

  @@all = [ ]

  def initialize(title, city)
    @title = title
    @city = city
    @@all << self
  end

  def self.all
    @@all
  end
  def performances
    Performance.all.select do |p_object|
      p_object.theater == self
    end
  end
  def musicals
  performances.flatten.map {|theater| theater.musical}
  end

end
