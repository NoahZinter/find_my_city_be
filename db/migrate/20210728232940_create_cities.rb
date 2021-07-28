class CreateCities < ActiveRecord::Migration[5.2]
  def change
    create_table :cities do |t|
      t.string :name
      t.string :summary
      t.string :category_name
      t.float :category_score
      t.float :total_score
      t.binary :picture

      t.timestamps
    end
  end
end
