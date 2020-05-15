class WeatherWatcher::CLI
  
  attr_accessor :user_location_url
  
  def call 
    puts "Welcome to the Weather Watcher"
    user_input = get_user_location 
    get_user_location_weather(user_input)
    input_day = get_day
    
    input_departure = get_leave_time
    input_return = get_return_time
    get_hourly_user_location_weather(input_day)
    weather_for_outing(input_departure, input_return)
    get_more_weather_or_exit
  end
  
  def get_user_location
    puts "Please enter your location's five digit zip code"
    input = gets.chomp
  end
  
  def get_user_location_weather(user_input)
    WeatherWatcher::Scraper.get_page_for_user_location(user_input)
  end
  
  def show_user_upcoming_days
      WeatherWatcher::Daycard.all.each do
      |day|
      puts "#{day.day}"
    end
  end
    
  def get_day
    puts "What date (MM/DD) are you going out? Example: 0515"
    show_user_upcoming_days
    input = gets.chomp
  end
  
  def get_hourly_user_location_weather(input_day)
    WeatherWatcher::Scraper.get_hourly_for_user_location(input_day)
  end
  
  def show_user_upcoming_hours
    WeatherWatcher::Hourcard.all.each.with_index(1) do |hour, index| 
      puts "#{index}. #{hour.hour}"
    end
  end

  def get_leave_time
    puts "When will be leaving (enter number next to the hour)?"
    show_user_upcoming_hours
    input = gets.chomp.to_i
  end
  
  
  def get_return_time
   puts  "When will you be home (enter number next to the hour)?"
   show_user_upcoming_hours
   input = gets.chomp.to_i
  end

  def weather_for_outing(input_departure, input_return)
   WeatherWatcher::Hourcard.select_hourcard_range(input_departure, input_return)
  end
  
  def get_more_weather_or_exit
    puts "Do you need more weather information? Enter yes or no"
    input = gets.chomp
    if input == "yes"
    call
    elsif input == "no"
    puts "Goodbye! Thank you for using Weather Watcher!"
    else 
    puts "Invalid Answer. Let's start over!"
    call
    end
  end

end