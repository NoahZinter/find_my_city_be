class CityDetailsFacade
  class << self
    def city_scores(city, state_initials)
      data = CityService.get_city_info(city, state_initials)
      CityDetail.new(data)
    end
  end
end
