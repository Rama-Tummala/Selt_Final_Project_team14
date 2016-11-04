class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users, force: :cascade do |t|
        t.string   :name
        t.string   :email
        t.string   :session_token
        t.string   :password_digest
        t.string   :home_city
        t.string   :recommended_places
        t.string   :places_visited
        t.string   :following
        t.datetime :created_at, null: false
        t.datetime :updated_at, null: false
    end
  end
end
