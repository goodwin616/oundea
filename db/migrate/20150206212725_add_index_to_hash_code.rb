class AddIndexToHashCode < ActiveRecord::Migration
  def change
  	add_index :users, :room_code, unique: true
  end
end


