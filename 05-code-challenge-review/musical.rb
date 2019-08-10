class Musical
  attr_accessor :name
  attr_reader :setting_city
  
  @@all = []
  
  def initialize(name, setting_city)
    @name = name
    @setting_city = setting_city
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def self.all_introductions
    # use name , setting_city
    # loops
    # parameters
    @@all.each do |musical_object|
      puts  "Welcome, this is #{musical_object.name}, set in #{musical_object.setting_city}"
    end
  end
  
  def perform_in_theater(theater, date)
    Performance.new(date, self, theater)
  end
  def performances
    Performance.all.select {|p_object| p_object.musical == self}
end
def theaters
    # a = []
    # performances.each do |p_object|
    #   a << p_object.theater
    # end
    performances.map {|p_object| p_object.theater}
  end

end
binding.pry
0