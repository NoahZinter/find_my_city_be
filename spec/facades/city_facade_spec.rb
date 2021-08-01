require 'rails_helper'

RSpec.describe 'CityFacade' do
  it 'returns a city with score details' do
    VCR.use_cassette('returns_city_data_correctly') do
      facade = CityFacade.city_data('denver', 'co')

      expect(facade).to be_a(CityDetail)
      expect(facade.summary).to be_a(String)
      expect(facade.total_score).to be_a(Float)
      expect(facade.summary).to eq("<p>Denver, Colorado, is among the top cities with a <b>free business environment</b>.\n\n    \n        According to our city rankings, this is a good place to live with high ratings in <b>startups</b>, <b>healthcare</b> and <b>environmental quality</b>.\n    \n\n    \n</p>\n\n\n    <p>Denver is one of the top ten city matches for 4.1% of Teleport users.</p>\n")
      expect(facade.total_score).to eq(61.41)
      expect(facade.categories_hash_array).to be_a(Array)

      expect(facade.categories_hash_array).to eq([{:name=>"Housing", :score_out_of_10=>3.8375},
      {:name=>"Cost of Living", :score_out_of_10=>5.102},
      {:name=>"Startups", :score_out_of_10=>7.8645},
      {:name=>"Venture Capital", :score_out_of_10=>6.117},
      {:name=>"Travel Connectivity", :score_out_of_10=>4.243},
      {:name=>"Commute", :score_out_of_10=>4.530000000000001},
      {:name=>"Business Freedom", :score_out_of_10=>8.671},
      {:name=>"Safety", :score_out_of_10=>5.371},
      {:name=>"Healthcare", :score_out_of_10=>8.615666666666666},
      {:name=>"Education", :score_out_of_10=>3.6245},
      {:name=>"Environmental Quality", :score_out_of_10=>7.11675},
      {:name=>"Economy", :score_out_of_10=>6.5145},
      {:name=>"Taxation", :score_out_of_10=>4.346},
      {:name=>"Internet Access", :score_out_of_10=>5.418500000000001},
      {:name=>"Leisure & Culture", :score_out_of_10=>6.2235},
      {:name=>"Tolerance", :score_out_of_10=>7.860499999999999},
      {:name=>"Outdoors", :score_out_of_10=>7.932999999999999}])
    end
  end

  it 'returns a photo of a city' do
    VCR.use_cassette('can_get_a_photo_of_a_searched_for_city') do
      facade = CityFacade.city_data('denver', 'co')

      expect(facade.picture).to eq("https://d13k13wj6adfdf.cloudfront.net/urban_areas/denver_web-9726d88300.jpg")
    end
  end
end
