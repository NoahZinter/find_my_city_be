class CityFacade
  class << self
    def city_scores(city)
      scores = CityService.get_city_scores(city)
      City.new(scores)
    end
  end
end
