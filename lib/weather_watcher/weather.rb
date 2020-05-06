require 'open-uri'
require 'pry'

class WeatherWatcher::Weather
  @@all = []
  
  attr_accessor :hour, :feelstemp, :description
  
  def initialize(hour)
   @hour = hour
   @feelstemp = feelstemp
   @description = description
   save
  end 

def self.all
  @@all
end

def save
  @@all << self
end

end