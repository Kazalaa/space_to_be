class RemoveDiameterFromPlanets < ActiveRecord::Migration[6.0]
  def change
    remove_column :planets, :diameter, :integer
  end
end
