require 'rails_helper'

RSpec.describe City do
  it 'it should build a City PORO' do
    data = CityService.get_city_info('denver', 'co')
    city = City.new(data, photo_data)

    expect(city.summary).to eq("<p>Denver, Colorado, is among the top cities with a <b>free business environment</b>.\n\n    \n        According to our city rankings, this is a good place to live with high ratings in <b>startups</b>, <b>healthcare</b> and <b>environmental quality</b>.\n    \n\n    \n</p>\n\n\n    <p>Denver is one of the top ten city matches for 4.1% of Teleport users.</p>\n")
    expect(city.total_score).to eq(61.41)
    expect(city.picture).to eq("https://d13k13wj6adfdf.cloudfront.net/urban_areas/denver_web-9726d88300.jpg")
  end
end
