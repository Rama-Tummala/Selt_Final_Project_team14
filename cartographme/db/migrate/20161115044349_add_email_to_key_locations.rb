class AddEmailToKeyLocations < ActiveRecord::Migration
  def change
    add_column :key_locations, :email, :string
  end
end
