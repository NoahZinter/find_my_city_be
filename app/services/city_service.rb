class CityService
  class << self
    def get_city_info(city, state_initials)
      response = conn.get("https://api.teleport.org/api/cities/?search=#{city}%2C%20#{state_initials}&embed=city%3Asearch-results%2Fcity%3Aitem%2Fcity%3Aurban_area%2Fua%3Ascores")
      parse_json(response)
    end

    private

    def conn
      Faraday.new(url: 'https://api.teleport.org')
    end

    def parse_json(response)
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end
