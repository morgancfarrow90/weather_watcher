require 'open-uri'
require 'pry'

class WeatherWatcher::Scraper
  
attr_accessor :hour, :temp, :precip, :location_entry

  def self.get_page_for_user_location(input_argument)
   @location_entry = input_argument
   page = Nokogiri::HTML(open("https://www.weatherbug.com/weather-forecast/10-day-weather/#{input_argument}"))
  
   daycard = page.css("li.day-card-list__item")
  
   daycard.each_with_index do |daycard, index|
     if index < 7
     day = daycard.css("span.date").text.gsub("-","")
      description = daycard.css("div.day-card__summary__description").first.text.strip
  
      WeatherWatcher::Daycard.new(day, description)
     end
    end
  end

  def self.get_hourly_for_user_location(input_argument, estimate)
   url = "https://www.weatherbug.com/weather-forecast/hourly/" + @location_entry + "?hour=2020#{input_argument}#{estimate}"
   
     page = Nokogiri::HTML(open(url))
    
     hourcard = page.css("div.hour-card")
   
      hourcard.each_with_index do |hourcard, index|
         hour = hourcard.css("div.time").text.strip
         temp = hourcard.css("div.feels-like").text.strip
         precip = hourcard.css("div.precip").text.strip
    
       WeatherWatcher::Hourcard.new(hour, temp, precip)
      
    end
   end
end
