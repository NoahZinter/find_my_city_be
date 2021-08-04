class CityDetail
  attr_reader :id,
              :city,
              :state,
              :summary,
              :total_score,
              :categories_hash_array,
              :population,
              :categories


  def initialize(data)
    if data[:_embedded][:"city:search-results"][0][:_embedded][:"city:item"][:_embedded].nil?
      @city = data[:_embedded][:"city:search-results"][0][:_embedded][:"city:item"][:full_name]
      @population = data[:_embedded][:"city:search-results"][0][:_embedded][:"city:item"][:population]
      @name = data[:_embedded][:"city:search-results"][0][:_embedded][:"city:item"][:name]
      @state = @city.split(",")[1][1..-1]
      @categories = nil
    else
      @name = data[:_embedded][:"city:search-results"][0][:_embedded][:"city:item"][:name]
      @population = nil
      @id = nil
      @city = data[:_embedded][:"city:search-results"][0][:_embedded][:"city:item"][:_embedded][:"city:urban_area"][:name]
      @state = data[:_embedded][:"city:search-results"][0][:_embedded][:"city:item"][:_embedded][:"city:urban_area"][:_links][:"ua:admin1-divisions"][0][:name]
      @summary = data[:_embedded][:"city:search-results"][0][:_embedded][:"city:item"][:_embedded][:"city:urban_area"][:_embedded][:"ua:scores"][:summary]
      @total_score = data[:_embedded][:"city:search-results"][0][:_embedded][:"city:item"][:_embedded][:"city:urban_area"][:_embedded][:"ua:scores"][:teleport_city_score].round(2)
      @categories = data[:_embedded][:"city:search-results"][0][:_embedded][:"city:item"][:_embedded][:"city:urban_area"][:_embedded][:"ua:scores"][:categories]
    end
  end

  def categories_hash_array
    if !@categories.nil?
      @categories.map do |category|
        category.delete(:color)
        category
      end
    end
  end
end
