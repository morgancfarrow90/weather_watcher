require 'open-uri'
require 'pry'

class WeatherWatcher::Scraper
  
attr_accessor :hour, :feelstemp, :windmph, :rain, :description; :user_location_url

def self.get_page_for_user_location
   page = Nokogiri::HTML(open(@user_location_url.to_s))
   hourcards = page.css("div.hour-card")
   
   hourcards.each do |h|
     puts h.text
   end
 end
 end
    
    
  #  page.css("div.hour-card").each do |card|
   #   hour = card.css("span.hour").text
    #  feelstemp = card.css("div.feels-like").text
     # description = card.css("div.description").text
      #windmph = card.css("div.value").text
      #rain = card.css ('div.precip')
    #  weather_info = {:hour => hour,
     #           :feelstemp => feelstemp,
      #          :description => description, 
       #         :windmph => windmph,
        #        :rain => rain}
      #weatherdata << weather_info
      #end
    #weatherdata
   #end
  #end
    

  ##def scrape_weather_index
   #  self.get_page_for_user_location.css("div.hour-card")
 # end

 # def make_hour_blocks
    #scrape_weather_index.each do |h|
     # WeatherWatcher::Weather.new_from_index_page(h)
  #  end
#  end
#end
