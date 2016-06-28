class Board < ActiveRecord::Base

  serialize :members, Array
  serialize :admin, Array
  serialize :tags, Array

  validates_presence_of :description, :name

end
