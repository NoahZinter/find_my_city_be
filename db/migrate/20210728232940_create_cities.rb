class CreateCities < ActiveRecord::Migration[5.2]
  def change
    create_table :cities do |t|
      t.string :city
      t.string :state
      t.string :summary
      t.float :total_score
      t.text :categories_hash_array
      t.string :picture

      t.timestamps
    end
  end
end
