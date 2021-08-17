class RemovePopulationFromPlanets < ActiveRecord::Migration[6.0]
  def change
    remove_column :planets, :population, :integer
  end
end
