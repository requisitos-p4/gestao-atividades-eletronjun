class AddAdminToBoard < ActiveRecord::Migration
  def change
    add_column :boards, :admin, :text
  end 
end
