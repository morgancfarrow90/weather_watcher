class WeatherWatcher::Scraper

  def get_page
    Nokogiri::HTML(open("https://www.weatherbug.com/weather-forecast/hourly/"))
  end
  
  def get_page_for_user_location
    

  def scrape_restaurants_index
     self.get_page.css("div[data-list='1-50'] a.item")
  end

  def make_restaurants
    scrape_restaurants_index.each do |r|
      WorldsBestRestaurants::Restaurant.new_from_index_page(r)
    end
  end
end
