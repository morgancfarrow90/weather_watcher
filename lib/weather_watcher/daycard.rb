require 'open-uri'
require 'pry'

class WeatherWatcher::Daycard
  @@all = []
  
  attr_accessor :day, :description
  
  def initialize(day, description)
   @day = day
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