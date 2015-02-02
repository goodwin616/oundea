class AddRoomCode < ActiveRecord::Migration
  def change
  	add_column :users, :room_code, :string
  end
end
