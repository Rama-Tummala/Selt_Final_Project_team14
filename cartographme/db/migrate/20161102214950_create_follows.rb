class CreateFollows < ActiveRecord::Migration
  def change
    create_table :follows do |t| 
 	    t.references 'user'
      t.references 'user'
    end
  end
end
