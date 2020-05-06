require 'open-uri'
require 'pry'

class WeatherWatcher::Scraper
  
attr_accessor :hour, :temp, :description

  def self.get_page_for_user_location(input_argument)
   page = Nokogiri::HTML(open("https://www.weatherbug.com/weather-forecast/hourly/#{input_argument}"))
   
   hourcards = page.css("div.hour-card")
   
    hourcards.each do |hourcard|
     hour = hourcard.css("div.time").text.strip
     temp = hourcard.css("div.feels-like").text.strip
     description = hourcard.css("li.hour-card__desktop__details__item").text.strip
    
     WeatherWatcher::Hourcard.new(hour, temp, description)
    end
   end

end
