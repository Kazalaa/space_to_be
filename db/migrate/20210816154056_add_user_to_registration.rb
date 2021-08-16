class AddUserToRegistration < ActiveRecord::Migration[6.0]
  def change
    add_reference :registrations, :user, null: false, foreign_key: true
  end
end
