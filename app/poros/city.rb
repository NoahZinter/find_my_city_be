class CityDetail
  attr_reader :categories,
              :summary,
              :total_score,
              :city,
              :state
              # :picture - won't know till we get endpoint

  def initialize(data)
    @categories = data[:_embedded][:"city:search-results"][0][:_embedded][:"city:item"][:_embedded][:"city:urban_area"][:_embedded][:"ua:scores"][:categories]
    @summary = data[:_embedded][:"city:search-results"][0][:_embedded][:"city:item"][:_embedded][:"city:urban_area"][:_embedded][:"ua:scores"][:summary]
    @total_score = data[:_embedded][:"city:search-results"][0][:_embedded][:"city:item"][:_embedded][:"city:urban_area"][:_embedded][:"ua:scores"][:teleport_city_score].round(2)
    @city = data[:_embedded][:"city:search-results"][0][:_embedded][:"city:item"][:_embedded][:"city:urban_area"][:name]
    @state = data[:_embedded][:"city:search-results"][0][:_embedded][:"city:item"][:_embedded][:"city:urban_area"][:_links][:"ua:admin1-divisions"][0][:name]
    # @picture = data[:picture] - won't know till we get endpoint
  end

  def categories_hash_array
    @categories.map do |category|
      category.delete(:color)
      category
    end
  end
end
