require_relative "weather_watcher/version"
require_relative "weather_watcher/user"
require_relative "weather_watcher/scraper"
require_relative "weather_watcher/hourcards"

require 'pry'
require 'nokogiri'

module WeatherWatcher
  class Error < StandardError; end
  # Your code goes here...
end
