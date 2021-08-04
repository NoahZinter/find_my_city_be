class EditCities < ActiveRecord::Migration[5.2]
  def change
    remove_column :cities, :picture, :string
    add_column :cities, :population, :integer
  end
end
