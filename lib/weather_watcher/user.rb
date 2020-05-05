class WeatherWatcher::User
  
  attr_accessor :user_location_url
  
  def call 
    puts "Welcome to the Weather Watcher"
    get_user_location 
    get_user_location_weather
    get_leave_time_and_length
    get_user_plans
  end
  
  def get_user_location
    #gets city-state-zipcode
    #prints upcoming hours
    puts "Please enter your location like this: city-state-zipcode (ex: bethesda-md-20816)"
    input = gets.chomp
    
    @user_location_url = "https://www.weatherbug.com/weather-forecast/hourly/" + "#{input}"
    
    #input is added to end of the url for weather website and sets scraper
  end
  
  def get_user_location_weather
    #to be scraped
  @upcominghours = ["11:00", "12:00", "13:00"]
  end

  def get_leave_time_and_length
    #user selects hour they are leaving and when they'll return
    puts "When will be leaving and when will you go home?"
    @upcominghours.each.with_index(1) do |hour, index| 
      puts "#{index}. #{hour}"
    end
  end
  
  def get_user_plans
    chosen_time = gets.strip
    if valid_input(chosen_time, @upcominghours)
  end
  end 
  
  def valid_input(input, data)
    input.to_i <= data.length && input.to_i > 0 
  end
  
  def weather_watcher_result
    #prints the concise overview of weather for that time period
  end
  
  def ask_again_or_exit
    #user can ask again or leave 
  end
  
end