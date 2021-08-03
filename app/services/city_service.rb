class CityService
  class << self
    def get_city_info(city, state_initials)
      city = ERB::Util.url_encode(city)
      response = conn.get("/api/cities/?search=#{city},#{state_initials}&limit=1&embed=city:search-results/city:item/city:urban_area/ua:scores")
      parse_json(response)
    end

    def get_photos_of_city(city)
      city = ERB::Util.url_encode(city)
      response = conn.get("/api/urban_areas/slug:#{city}/images/")
      res = parse_json(response)
      if response.status == 404
        response = conn.get("/api/urban_areas/slug:denver/images/")
        parse_json(response)
      else
        res
      end
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
