require 'open-uri'
require 'pry'

class WeatherWatcher::Scraper
  
attr_accessor :hour, :temp, :precip

def self.get_page_for_user_location(input_argument)
  page = Nokogiri::HTML(open("https://www.weatherbug.com/weather-forecast/10-day-weather/#{input_argument}"))
  
  daycard = page.css("div.day-card")
  
  daycard.each do |daycard|
    day = daycard.css("div.day-card__title .date-wrap").text.strip
    WeatherWatcher::Daycard.new(day)
    binding.pry
  end
end

  def self.get_hourly_for_user_location(input_argument)
   page = Nokogiri::HTML(open("https://www.weatherbug.com/weather-forecast/hourly/#{input_argument}"))
   
   hourcard = page.css("div.hour-card")
   
    hourcard.each do |hourcard|
     hour = hourcard.css("div.time").text.strip
     temp = hourcard.css("div.feels-like").text.strip
     precip = hourcard.css("div.precip").text.strip
    
     WeatherWatcher::Hourcard.new(hour, temp, precip)
    end
   end

end
