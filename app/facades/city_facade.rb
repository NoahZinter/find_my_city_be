class CityFacade
  class << self
    def city_scores(city, state_initials)
      scores = CityService.get_city_info(city, state_initials)
      City.new(scores)
    end
  end
end
