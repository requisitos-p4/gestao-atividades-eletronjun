class Board < ActiveRecord::Base

  belongs_to :user, :foreign_key => "admin_id"

  validates_presence_of :description, :name

end
