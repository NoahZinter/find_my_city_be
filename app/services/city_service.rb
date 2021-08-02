class CityService
  class << self
    def get_city_info(city, state_initials)
      city = city.gsub(/[' ']/, '%20')
      response = conn.get("/api/cities/?search=#{city.downcase}, #{state_initials}&limit=1&embed=city:search-results/city:item/city:urban_area/ua:scores")
      parse_json(response)
    end

    def get_photos_of_city(city)
      city = city.gsub(/[' ']/, '%20')
      response = conn.get("/api/urban_areas/slug:#{city.downcase}/images/")
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
