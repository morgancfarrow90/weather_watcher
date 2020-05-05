class WeatherWatcher::Scraper

  def get_page
    Nokogiri::HTML(open("https://www.weatherbug.com/weather-forecast/hourly/"))
  end
  
  def get_page_for_user_location
    Nokogiri::HTML(open(@user_location_url))
  end
    

  def scrape_weather_index
     self.get_page_for_user_location.css("div.hour-card")
  end

  def make_hour_blocks
    scrape_weather_index.each do |h|
      WeatherWatcher::Weather.new_from_index_page(h)
    end
  end
end
