class WeatherWatcher::User
  
  def call 
    puts "Welcome to the Weather Watcher"
    get_user_location 
  end
  
  def get_user_location
    #gets city-state-zipcode"
    #prints upcoming hours
    puts "Please enter your location like this: city-state-zipcode (ex: bethesda-md-20816)"
    input = gets.chomp
    
    user_location_url = "https://www.weatherbug.com/weather-forecast/hourly/"{#input}"
    
    #input is added to end of the url for weather website and sets scraper
  end
  
  def get_leave_time_and_length
    #user selects hour they are leaving and when they'll return
  end
  
  def weather_watcher_result
    #prints the concise overview of weather for that time period
  end
  
  def ask_again_or_exit
    #user can ask again or leave 
  end
  
end