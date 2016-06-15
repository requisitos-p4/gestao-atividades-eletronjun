class Board < ActiveRecord::Base

  validates_presence_of :description, :name

end
