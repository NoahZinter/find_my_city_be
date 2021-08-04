# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

City.destroy_all
User.destroy_all
Favorite.destroy_all

pers = City.create!(city: 'Persepolis', state: 'Ohio', summary: 'This place is terrible', total_score: 12.34, population: 1000, categories_hash_array: '[{:name=>"Housing", :score_out_of_10=>3.8375},
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
    {:name=>"Outdoors", :score_out_of_10=>7.932999999999999}]')
usr = User.create!(email: 'em@il.com', password: 'apples')
Favorite.create!(city_id: pers.id, user_id: usr.id, city_name: 'Persepolis',state: 'Ohio', summary: 'This place is terrible', total_score: 12.34, population: 1000, categories_hash_array: '[{:name=>"Housing", :score_out_of_10=>3.8375},
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
    {:name=>"Outdoors", :score_out_of_10=>7.932999999999999}]')