class RenameRegistrationsToBookings < ActiveRecord::Migration[6.0]
  def change
    rename_table :registrations, :bookings
  end
end
