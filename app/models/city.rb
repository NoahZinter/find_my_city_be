class City < ApplicationRecord
  serialize :categories_hash_array, Array

  has_many :favorites
end
