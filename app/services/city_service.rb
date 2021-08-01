class CityService
  class << self
    def get_city_info(city, state_initials)
      response = conn.get("/api/cities/?search=#{city}, #{state_initials}&limit=1&embed=city:search-results/city:item/city:urban_area/ua:scores")

      parse_json(response)
    end

    def get_photos_of_city(city)
      response = conn.get("/api/urban_areas/slug:#{city}/images/")

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
