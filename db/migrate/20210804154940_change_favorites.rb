class ChangeFavorites < ActiveRecord::Migration[5.2]
  def change
    add_column :favorites, :city_name, :string
    add_column :favorites, :state, :string
    add_column :favorites, :summary, :string
    add_column :favorites, :total_score, :float
    add_column :favorites, :categories_hash_array, :text
  end
end
