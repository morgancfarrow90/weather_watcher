class WeatherWatcher::User
  
  attr_accessor :user_location_url
  
  def call 
    puts "Welcome to the Weather Watcher"
    user_input = get_user_location 
    get_user_location_weather(user_input)
    get_leave_time_and_length
    get_user_plans
  end
  
  def get_user_location
    puts "Please enter your location like this: city-state-zipcode (ex: bethesda-md-20816)"
    input = gets.chomp
    #input is added to end of the url for weather website and sets scraper
  end
  
  def get_user_location_weather(user_input)
    WeatherWatcher::Scraper.get_page_for_user_location(user_input)
  end
  
  def show_user_location_weather
    Hourcards.all.each.with_index(1) do |hour, index| 
      puts "#{index}. #{hour.hour}"
    end
  end

  def get_leave_time_and_length
    puts "When will be leaving and when will you go home?"
    show_user_location_weather
    #wait for user input
  end
  
  def get_user_plans
    chosen_time = gets.strip.to_i
    show_weather_for(chosen_time) if valid_input(chosen_time, @upcominghours)
  end 
  
  def valid_input(input, data)
    input.to_i <= data.length && input.to_i > 0 
  end
  
  def show_weather_for(chosen_time)
    leavetime = @upcominghours[chosen_time -1]
    puts "Here is the weather to be ready for when you leave at #{leavetime}."
    
  end
  
  def ask_again_or_exit
    #user can ask again or leave 
  end
  
end