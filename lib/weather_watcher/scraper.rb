require 'open-uri'
require 'pry'

class WeatherWatcher::Scraper
  
attr_accessor :hour, :feelstemp, :windmph, :rain, :description; :user_location_url

def self.get_page_for_user_location(input_argument)
   page = Nokogiri::HTML(open("https://www.weatherbug.com/weather-forecast/hourly/#{input_argument}"))
   
   hourcards = page.css("div.hour-card")
   
   hourcards.each do |hourcard|
     hour = hourcard.css("div.time").text.strip
     WeatherWatcher::Hourcard.new(hour)
   end
 end

 
 def self.get_weather_range(input_argument, input_departure, input_return)
   
   page = Nokogiri::HTML(open("https://www.weatherbug.com/weather-forecast/hourly/#{input_argument}"))
   hourdata = {}
   
    hourcards = page.css("div.hour-card")
    hourcards.collect do |hourcard|
    hourdata[:hour] = hourcard.css("div.time").text.strip
    hourdata[:feelstemp] = hourcard.css("div.feels-like").text.strip
    hourdata[:description] = hourcard.css("li.hour-card__desktop__details__item").text.strip
    binding pry
    end
    return hourdata
   end
  end
    

  ##def scrape_weather_index
   #  self.get_page_for_user_location.css("div.hour-card")
 # end

 # def make_hour_blocks
    #scrape_weather_index.each do |h|
     # WeatherWatcher::Weather.new_from_index_page(h)
  #  end
#  end
#end
