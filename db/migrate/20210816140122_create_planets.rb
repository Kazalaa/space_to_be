class CreatePlanets < ActiveRecord::Migration[6.0]
  def change
    create_table :planets do |t|
      t.string :name
      t.integer :rotation_period
      t.integer :diameter
      t.string :climate
      t.string :gravity
      t.float :surface_water
      t.string :terrain
      t.integer :population
      t.integer :price
      t.string :vehicules

      t.timestamps
    end
  end
end
