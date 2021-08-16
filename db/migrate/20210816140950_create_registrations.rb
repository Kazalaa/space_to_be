class CreateRegistrations < ActiveRecord::Migration[6.0]
  def change
    create_table :registrations do |t|
      t.boolean :status
      t.integer :price
      t.references :planet, null: false, foreign_key: true

      t.timestamps
    end
  end
end
