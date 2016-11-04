class CreateKeyLocations < ActiveRecord::Migration
  def change
    create_table :key_locations do |t|
      t.string :lat
      t.string :lng
      t.string :infowindow
    end
  end
end
