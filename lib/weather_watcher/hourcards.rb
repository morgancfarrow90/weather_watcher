require 'open-uri'
require 'pry'

class WeatherWatcher::Hourcards
  @@all = []
  
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
end
