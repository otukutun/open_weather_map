require 'rest_client'
module OpenWeatherMap
  URL = 'http://api.openweathermap.org/data/2.5/weather'
  class Base

    def cond
      @response['weather'][0]['main']
    end

    def temp_min
      @response['main']['temp_min']
    end

    def temp_max
      @response['main']['temp_max']
    end

    def temp_min_celsius
      to_celsius @response['main']['temp_min']
    end

    def temp_max_celsius
      to_celsius @response['main']['temp_max']
    end

    private
    def request(params)
      response = RestClient.get OpenWeatherMap::URL, { params: params }
      JSON.parse(response)
    end

    def to_celsius(temp)
      (temp.to_f - 273.15).round(1)
    end

  end
end

