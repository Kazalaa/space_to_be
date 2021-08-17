class AddDiameterToPlanets < ActiveRecord::Migration[6.0]
  def change
    add_column :planets, :diameter, :string
  end
end
