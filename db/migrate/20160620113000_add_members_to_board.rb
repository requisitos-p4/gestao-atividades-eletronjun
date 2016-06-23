class AddMembersToBoard < ActiveRecord::Migration
  def change
    add_column :boards, :members, :text
  end 
end
