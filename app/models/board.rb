class Board < ActiveRecord::Base

  belongs_to :user, :foreign_key => "admin_id"

  has_many :members, :foreign_key => "member_id", :class_name => "User"

  validates_presence_of :description, :name

end
