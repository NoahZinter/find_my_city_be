require 'rails_helper'

RSpec.describe 'CityService API' do
  xit 'returns city score data correctly', :vcr do
    data = CityService.get_city_info('denver', 'co')[:_embedded][:"city:search-results"][0][:_embedded][:"city:item"][:_embedded][:"city:urban_area"][:_embedded][:"ua:scores"]
    # binding.pry

    expect(data).to have_key(:categories)
    expect(data).to have_key(:summary)
    expect(data).to have_key(:teleport_city_score)

    expect(data[:categories]).to be_an(Array)
    expect(data[:summary]).to be_an(String)
    expect(data[:teleport_city_score]).to be_an(Float)

    expect(data[:categories].count).to eq(17)

    data[:categories].each do |category|

      expect(category).to have_key(:color)
      expect(category[:color]).to be_an(String)

      expect(category).to have_key(:name)
      expect(category[:name]).to be_an(String)

      expect(category).to have_key(:score_out_of_10)
      expect(category[:score_out_of_10]).to be_an(Float)
    end
  end

  it 'finds city' do
    # data = CityService.get_city_info('denver', 'co')[:_embedded][:"city:search-results"][0][:_embedded][:"city:item"][:_embedded][:"city:urban_area"][:_embedded][:"ua:scores"]
    # data = CityService.get_city_info('spokane', 'wa')[:_embedded][:"city:search-results"][0][:_embedded][:"city:item"]
    # binding.pry
  end
end
