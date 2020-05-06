require 'open-uri'
require 'pry'

class WeatherWatcher::Hourcard
  @@all = []
  
  attr_accessor :hour, :temp, :description 
  
  def initialize(hour, temp, description)
   @hour = hour
   @temp = temp
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
