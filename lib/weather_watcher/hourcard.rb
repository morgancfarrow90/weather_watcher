require 'open-uri'
require 'pry'

class WeatherWatcher::Hourcard
  @@all = []
  
  attr_accessor :hour, :temp, :precip
  
  def initialize(hour, temp, precip)
   @hour = hour
   @temp = temp
   @precip = precip
   save
  end 

  def self.all
   @@all
  end

  def save
   @@all << self
  end

  def self.select_hourcard_range(depart_time, return_time)
  
  depart_index = (depart_time.to_i) - 1
  return_index = (return_time.to_i) - 1
  
  subsection = [self.all.slice(depart_index..return_index)]
  
    subsection.flatten.each do |index|
      puts "#{index.hour} - #{index.temp} - #{index.precip}"
    end
  end

end

