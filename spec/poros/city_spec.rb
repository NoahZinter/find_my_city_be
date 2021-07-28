require 'rails_helper'

RSpec.describe City do
  it 'it should build a City PORO' do
    city = City.new(data)
    # city = City.new(score_data, details_data, picture_data)

    expect(city.summary).to eq("<p>Denver, Colorado, is among the top cities with a <b>free business environment</b>.\n\n    \n        According to our city rankings, this is a good place to live with high ratings in <b>startups</b>, <b>healthcare</b> and <b>environmental quality</b>.\n    \n\n    \n</p>\n\n\n    <p>Denver is one of the top ten city matches for 4.1% of Teleport users.</p>\n")
    expect(city.total_score).to eq(61.41)

    expect(city.categories_array).to eq(["Housing, 3.8375",
     "Cost of Living, 5.102",
     "Startups, 7.8645",
     "Venture Capital, 6.117",
     "Travel Connectivity, 4.243",
     "Commute, 4.530000000000001",
     "Business Freedom, 8.671",
     "Safety, 5.371",
     "Healthcare, 8.615666666666666",
     "Education, 3.6245",
     "Environmental Quality, 7.11675",
     "Economy, 6.5145",
     "Taxation, 4.346",
     "Internet Access, 5.418500000000001",
     "Leisure & Culture, 6.2235",
     "Tolerance, 7.860499999999999",
     "Outdoors, 7.932999999999999"])
    expect(city.categories_hash_array).to eq([{:name=>"Housing", :score_out_of_10=>3.8375},
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

    # expect(city.id).to eq() - details_data
    # expect(city.name).to eq() - details_data
    # expect(city.picture).to eq() - picture_data
  end
end
