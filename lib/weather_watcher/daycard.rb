require 'open-uri'
require 'pry'

class WeatherWatcher::Daycard
  @@all = []
  
  attr_accessor :day
  
  def initialize(day)
   @day = day
   
   save
  end 

  def self.all
   @@all
  end

  def save
   @@all << self
  end

end