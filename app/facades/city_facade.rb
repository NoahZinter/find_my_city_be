class CityFacade
  class << self
    def city_data(city, state_initials)
      data = CityService.get_city_info(city, state_initials)
      photo_data = CityService.get_photos_of_city(city)
      City.new(data, photo_data)
    end
  end
end