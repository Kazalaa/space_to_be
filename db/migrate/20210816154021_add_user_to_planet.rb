class AddUserToPlanet < ActiveRecord::Migration[6.0]
  def change
    add_reference :planets, :user, null: false, foreign_key: true
  end
end
