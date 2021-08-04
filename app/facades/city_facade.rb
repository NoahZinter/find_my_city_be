class CityFacade
  class << self
    def city_data(city, state_initials)
      data = CityService.get_city_info(city, state_initials)
      if data[:count] != 0
        CityDetail.new(data)
      else
        return false
      end
    end
  end
end
