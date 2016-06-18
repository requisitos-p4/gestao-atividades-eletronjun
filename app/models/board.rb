class Board < ActiveRecord::Base

  has_one :admin, class_name: "User"
  has_many :members, class_name: "User"

  validates_presence_of :description, :name

end
