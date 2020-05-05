class WeatherWatcher::User
  
  attr_accessor :user_location_url
  
  def call 
    puts "Welcome to the Weather Watcher"
    get_user_location 
    get_user_location_weather
    get_leave_time_and_length
    get_user_plans
    show_weather_for(chosen_time)
  end
  
  def get_user_location
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
    puts "When will be leaving and when will you go home?"
    @upcominghours.each.with_index(1) do |hour, index| 
      puts "#{index}. #{hour}"
    end
  end
  
  def get_user_plans
    chosen_time = gets.strip.to_i
    show_weather_for(chosen_time) if valid_input(chosen_time, @upcominghours)
  end 
  
  def valid_input(input, data)
    input.to_i <= data.length && input.to_i > 0 
  end
  
  def show_weather_for(chosen_time)
    leavetime = @upcominghours[chosen_time-1]
    puts "Here is the weather to be ready for when you leave at #{leavetime}."
    binding pry 
  end
  
  def ask_again_or_exit
    #user can ask again or leave 
  end
  
end