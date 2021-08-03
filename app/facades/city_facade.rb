class CityFacade
  class << self
    def city_data(city, state_initials)
      data = CityService.get_city_info(city, state_initials)
      CityDetail.new(data)
    end
  end
end
