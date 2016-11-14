class CreateKeyLocationsUsersJoin < ActiveRecord::Migration
  def change
    create_table :key_locations_users, :id => false do |t|
      t.integer "key_location_id"
      t.integer "user_id"
    end
    add_index :key_locations_users, ["key_location_id", "user_id"]
  end
end
