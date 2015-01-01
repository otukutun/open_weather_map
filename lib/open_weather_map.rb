require 'open_weather_map/version'
require 'rest_client'

module OpenWeatherMap
  URL = 'http://api.openweathermap.org/data/2.5/weather'
  class City
    def initialize(country, city)
      params = { q: "#{country},#{city}" }
      @response = request params
    end

    def cond
      @response['weather'][0]['main']
    end

    def temp_min
      @response['main']['temp_min']
    end

    def temp_max
      @response['main']['temp_max']
    end

    private
    def request(params)
      response = RestClient.get OpenWeatherMap::URL, { params: params }
      JSON.parse(response)
    end

  end

  class Geocode
    def initialize(lat, lon)
      params = { lat: lat, lon: lon }
      request params
    end

    private
    def request(params)
      response = RestClient.get OpenWeatherMap::URL, { params: params }
      JSON.parse(response)
    end
  end
end
