require 'rails_helper'

RSpec.describe 'CityFacade' do
  it 'returns a city with score details' do
    VCR.use_cassette('returns_city_data_correctly') do
      facade = CityFacade.city_data('denver', 'co')

      expect(facade).to be_a(City)
      expect(facade.summary).to be_a(String)
      expect(facade.total_score).to be_a(Float)
      expect(facade.summary).to eq("<p>Denver, Colorado, is among the top cities with a <b>free business environment</b>.\n\n    \n        According to our city rankings, this is a good place to live with high ratings in <b>startups</b>, <b>healthcare</b> and <b>environmental quality</b>.\n    \n\n    \n</p>\n\n\n    <p>Denver is one of the top ten city matches for 4.1% of Teleport users.</p>\n")
      expect(facade.total_score).to eq(61.41)
    end
  end
end
