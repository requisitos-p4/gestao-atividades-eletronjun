class CreateBoards < ActiveRecord::Migration
  def change
    create_table :boards do |t|
      t.string :name
      t.string :description
      t.string :admin

      t.timestamps null: false
    end
  end
end
