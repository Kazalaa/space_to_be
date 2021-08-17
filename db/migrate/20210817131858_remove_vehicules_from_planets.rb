class RemoveVehiculesFromPlanets < ActiveRecord::Migration[6.0]
  def change
    remove_column :planets, :vehicules, :string
  end
end
