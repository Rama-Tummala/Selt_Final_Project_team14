class CreateKeyLocations < ActiveRecord::Migration
  def change
    create_table :key_locations do |t|
      t.string :lat
      t.string :lng
      t.string :name
      t.text   :description
    end
  end
end
