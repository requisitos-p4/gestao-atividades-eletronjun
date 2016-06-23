class Board < ActiveRecord::Base

  serialize :members, Array
  serialize :admin, Array

  validates_presence_of :description, :name

end
