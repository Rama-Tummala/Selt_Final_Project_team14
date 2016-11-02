class CreateKeyLocations < ActiveRecord::Migration
  def change
    create_table :key_locations, force: :cascade do |t|
      t.string   :lat
      t.string   :lng
      t.string   :location_name
      t.string   :key_id
    end
  end
end
