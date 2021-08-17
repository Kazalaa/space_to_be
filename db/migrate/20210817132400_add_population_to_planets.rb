class AddPopulationToPlanets < ActiveRecord::Migration[6.0]
  def change
    add_column :planets, :population, :string
  end
end
