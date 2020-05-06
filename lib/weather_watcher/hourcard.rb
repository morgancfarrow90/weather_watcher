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

def self.select_hourcard_range(depart_time, return_time)
  
  depart_index = (depart_time.to_i) - 1
  return_index = (return_time.to_i) - 1
  subsection = [self.all.slice(depart_index, return_index)]
  
  subsection.flatten.each do |index|
    
  
    binding.pry 
  end
  #puts @hour "-" @temp "-" @description

end


end

