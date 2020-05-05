class WeatherWatcher::Hourcards
  @@all = []
  attr_accessor :hour 
  
def initialize(hour)
  @hour = hour
  save
end 

def self.all
  @@all
end

def save
  @all << self
end
