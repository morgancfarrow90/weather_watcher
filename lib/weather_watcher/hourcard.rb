require 'open-uri'
require 'pry'

class WeatherWatcher::Hourcard
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
  @@all << self
end

end
