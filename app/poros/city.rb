class City
  attr_reader :categories,
              :summary,
              :total_score
              # :id, - won't know till we get endpoint
              # :name, - won't know till we get endpoint
              # :picture - won't know till we get endpoint

  def initialize(data)
    # @id = data[:id] - won't know till we get endpoint
    # @name = data[:name] - won't know till we get endpoint
    @categories = data[:categories]
    @summary = data[:summary]
    @total_score = data[:teleport_city_score]
    # @picture = data[:picture] - won't know till we get endpoint
  end

  def categories_array
    @categories.map { |category| "#{category[:name]}, #{category[:score_out_of_10]}" }
    # @categories.map { |category| category[:name] + ', ' + category[:score_out_of_10].to_s }
  end

  def categories_hash_array
    @categories.map do |category|
      category.delete(:color)
      category
    end
  end
end
