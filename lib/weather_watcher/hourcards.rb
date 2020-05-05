require 'open-uri'
require 'pry'

class WeatherWatcher::Hourcards
  @@all = []
  
  def initialize(hour)
   @hour = hour
    save
  end 

def self.all
  WeatherWatcher::Scraper.get_page_for_user_location if @@all.empty?
  @@all
end

def save
  @all << self
end
end
