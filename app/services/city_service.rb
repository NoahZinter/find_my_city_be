class CityService
  class << self
    def get_city_scores(city)
      response = conn.get("/api/urban_areas/slug:#{city}/scores")
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
