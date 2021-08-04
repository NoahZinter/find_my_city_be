class CityDetail
  attr_reader :id,
              :city,
              :state,
              :summary,
              :total_score,
              :categories_hash_array


  # def initialize(data)
  #   binding.pry
  #   # if !data[:_embedded].nil?
  #   @id = nil
  #   @city = data[:_embedded][:"city:search-results"][0][:_embedded][:"city:item"][:_embedded][:"city:urban_area"][:name]
  #   @state = data[:_embedded][:"city:search-results"][0][:_embedded][:"city:item"][:_embedded][:"city:urban_area"][:_links][:"ua:admin1-divisions"][0][:name]
  #   @summary = data[:_embedded][:"city:search-results"][0][:_embedded][:"city:item"][:_embedded][:"city:urban_area"][:_embedded][:"ua:scores"][:summary]
  #   @total_score = data[:_embedded][:"city:search-results"][0][:_embedded][:"city:item"][:_embedded][:"city:urban_area"][:_embedded][:"ua:scores"][:teleport_city_score].round(2)
  #   @categories = data[:_embedded][:"city:search-results"][0][:_embedded][:"city:item"][:_embedded][:"city:urban_area"][:_embedded][:"ua:scores"][:categories]
  # end

  def initialize(data)
    if data[:_embedded][:"city:search-results"][0][:_embedded][:"city:item"][:_embedded].nil?
      @name = data[:_embedded][:"city:search-results"][0][:_embedded][:"city:item"][:full_name]
      @population = data[:_embedded][:"city:search-results"][0][:_embedded][:"city:item"][:population]
    else
      @name = data[:_embedded][:"city:search-results"][0][:_embedded][:"city:item"][:name]
      @id = nil
      @city = data[:_embedded][:"city:search-results"][0][:_embedded][:"city:item"][:_embedded][:"city:urban_area"][:name]
      @state = data[:_embedded][:"city:search-results"][0][:_embedded][:"city:item"][:_embedded][:"city:urban_area"][:_links][:"ua:admin1-divisions"][0][:name]
      @summary = data[:_embedded][:"city:search-results"][0][:_embedded][:"city:item"][:_embedded][:"city:urban_area"][:_embedded][:"ua:scores"][:summary]
      @total_score = data[:_embedded][:"city:search-results"][0][:_embedded][:"city:item"][:_embedded][:"city:urban_area"][:_embedded][:"ua:scores"][:teleport_city_score].round(2)
      @categories = data[:_embedded][:"city:search-results"][0][:_embedded][:"city:item"][:_embedded][:"city:urban_area"][:_embedded][:"ua:scores"][:categories]
    end
    binding.pry
  end


  def categories_hash_array
    @categories.map do |category|
      category.delete(:color)
      category
    end
  end
end
