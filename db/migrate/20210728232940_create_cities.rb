class CreateCities < ActiveRecord::Migration[5.2]
  def change
    create_table :cities do |t|
      t.string :name
      t.string :summary
      t.float :total_score
      t.string :picture

      t.timestamps
    end
  end
end
