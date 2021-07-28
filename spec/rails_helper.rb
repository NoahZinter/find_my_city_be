# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'simplecov'
SimpleCov.start
require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../config/environment', __dir__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'
# Add additional requires below this line. Rails is not loaded until this point!

# Requires supporting ruby files with custom matchers and macros, etc, in
# spec/support/ and its subdirectories. Files matching `spec/**/*_spec.rb` are
# run as spec files by default. This means that files in spec/support that end
# in _spec.rb will both be required and run as specs, causing the specs to be
# run twice. It is recommended that you do not name files matching this glob to
# end with _spec.rb. You can configure this pattern with the --pattern
# option on the command line or in ~/.rspec, .rspec or `.rspec-local`.
#
# The following line is provided for convenience purposes. It has the downside
# of increasing the boot-up time by auto-requiring all files in the support
# directory. Alternatively, in the individual `*_spec.rb` files, manually
# require only the support files necessary.
#
# Dir[Rails.root.join('spec', 'support', '**', '*.rb')].sort.each { |f| require f }

# Checks for pending migrations and applies them before tests are run.
# If you are not using ActiveRecord, you can remove these lines.
begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end
RSpec.configure do |config|
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.include FactoryBot::Syntax::Methods
  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # You can uncomment this line to turn off ActiveRecord support entirely.
  # config.use_active_record = false

  # RSpec Rails can automatically mix in different behaviours to your tests
  # based on their file location, for example enabling you to call `get` and
  # `post` in specs under `spec/controllers`.
  #
  # You can disable this behaviour by removing the line below, and instead
  # explicitly tag your specs with their type, e.g.:
  #
  #     RSpec.describe UsersController, type: :controller do
  #       # ...
  #     end
  #
  # The different available types are documented in the features, such as in
  # https://relishapp.com/rspec/rspec-rails/docs
  config.infer_spec_type_from_file_location!

  # Filter lines from Rails gems in backtraces.
  config.filter_rails_from_backtrace!
  # arbitrary gems may also be filtered via:
  # config.filter_gems_from_backtrace("gem name")
end
Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end

  VCR.configure do |config|
    config.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
    config.hook_into :webmock
    # config.filter_sensitive_data('<moviedb_api_key>') { ENV['movie_db_api']}
    config.default_cassette_options = { re_record_interval: 30.days }
    config.allow_http_connections_when_no_cassette = true
    config.configure_rspec_metadata!
  end
end

def data
  null = nil
  {
    "_links": {
        "curies": [
            {
                "href": "https://developers.teleport.org/api/resources/Location/#!/relations/{rel}/",
                "name": "location",
                "templated": true
            },
            {
                "href": "https://developers.teleport.org/api/resources/City/#!/relations/{rel}/",
                "name": "city",
                "templated": true
            },
            {
                "href": "https://developers.teleport.org/api/resources/UrbanArea/#!/relations/{rel}/",
                "name": "ua",
                "templated": true
            },
            {
                "href": "https://developers.teleport.org/api/resources/Country/#!/relations/{rel}/",
                "name": "country",
                "templated": true
            },
            {
                "href": "https://developers.teleport.org/api/resources/Admin1Division/#!/relations/{rel}/",
                "name": "a1",
                "templated": true
            },
            {
                "href": "https://developers.teleport.org/api/resources/Timezone/#!/relations/{rel}/",
                "name": "tz",
                "templated": true
            }
        ],
        "self": {
            "href": "https://api.teleport.org/api/urban_areas/slug:denver/scores/"
        }
    },
    "categories": [
        {
            "color": "#f3c32c",
            "name": "Housing",
            "score_out_of_10": 3.8375
        },
        {
            "color": "#f3d630",
            "name": "Cost of Living",
            "score_out_of_10": 5.102
        },
        {
            "color": "#f4eb33",
            "name": "Startups",
            "score_out_of_10": 7.8645
        },
        {
            "color": "#d2ed31",
            "name": "Venture Capital",
            "score_out_of_10": 6.117
        },
        {
            "color": "#7adc29",
            "name": "Travel Connectivity",
            "score_out_of_10": 4.243
        },
        {
            "color": "#36cc24",
            "name": "Commute",
            "score_out_of_10": 4.530000000000001
        },
        {
            "color": "#19ad51",
            "name": "Business Freedom",
            "score_out_of_10": 8.671
        },
        {
            "color": "#0d6999",
            "name": "Safety",
            "score_out_of_10": 5.371
        },
        {
            "color": "#051fa5",
            "name": "Healthcare",
            "score_out_of_10": 8.615666666666666
        },
        {
            "color": "#150e78",
            "name": "Education",
            "score_out_of_10": 3.6245
        },
        {
            "color": "#3d14a4",
            "name": "Environmental Quality",
            "score_out_of_10": 7.11675
        },
        {
            "color": "#5c14a1",
            "name": "Economy",
            "score_out_of_10": 6.5145
        },
        {
            "color": "#88149f",
            "name": "Taxation",
            "score_out_of_10": 4.346
        },
        {
            "color": "#b9117d",
            "name": "Internet Access",
            "score_out_of_10": 5.418500000000001
        },
        {
            "color": "#d10d54",
            "name": "Leisure & Culture",
            "score_out_of_10": 6.2235
        },
        {
            "color": "#e70c26",
            "name": "Tolerance",
            "score_out_of_10": 7.860499999999999
        },
        {
            "color": "#f1351b",
            "name": "Outdoors",
            "score_out_of_10": 7.932999999999999
        }
    ],
    "summary": "<p>Denver, Colorado, is among the top cities with a <b>free business environment</b>.\n\n    \n        According to our city rankings, this is a good place to live with high ratings in <b>startups</b>, <b>healthcare</b> and <b>environmental quality</b>.\n    \n\n    \n</p>\n\n\n    <p>Denver is one of the top ten city matches for 4.1% of Teleport users.</p>\n",
    "teleport_city_score": 61.413243243243265
}
end

