class CityDetail
  attr_reader :categories

  def initialize(data)
    @categories = data[:_embedded][:"city:search-results"][0][:_embedded][:"city:item"][:_embedded][:"city:urban_area"][:_embedded][:"ua:scores"][:categories]
  end

  def categories_hash_array
    @categories.map do |category|
      category.delete(:color)
      category
    end
  end
end
