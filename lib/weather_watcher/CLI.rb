class WeatherWatcher::CLI
  
  def call 
    puts "Welcome to the Weather Watcher"
    user_input = get_user_location 
    get_user_location_weather(user_input)
    input_day = get_day
    estimate = get_estimated_leave_time
    get_hourly_user_location_weather(input_day, estimate)
    input_departure = get_leave_time
    input_return = get_return_time
    weather_for_outing(input_departure, input_return)
    get_more_weather_or_exit
  end
  
  def get_user_location
    puts "What location do you need weather information for? Please enter the five digit zip code."
    input = gets.chomp
  end
  
  def get_user_location_weather(user_input)
    WeatherWatcher::Scraper.get_page_for_user_location(user_input)
  end
  
  def show_user_upcoming_week
    puts "Here is a look at the week ahead."
    WeatherWatcher::Daycard.all.each do |day|
      puts "#{day.day}"
      puts "#{day.description}"
    end
  end
    
  def get_day
    show_user_upcoming_week
    puts "_______"
    puts ""
    puts "What day (MMDD) in the next week are you going out? Example: 0515"
    input = gets.chomp
  end
  
  def get_estimated_leave_time
   puts "About what time will you head out? Enter hour in miliary time (00-24)"
   input = gets.chomp
  end
  
  def get_hourly_user_location_weather(input_day, estimate)
    WeatherWatcher::Scraper.get_hourly_for_user_location(input_day, estimate)
  end
  
  def show_user_upcoming_hours
    WeatherWatcher::Hourcard.all.each.with_index(1) do |hour, index| 
      puts "#{index}. #{hour.hour}"
    end
  end
  
  def get_leave_time
    puts "When will you be leaving (enter number next to the hour)?"
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