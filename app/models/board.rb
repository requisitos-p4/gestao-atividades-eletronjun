class Board < ActiveRecord::Base

  # belongs_to :user

  validates_presence_of :description, :name, :admin

end
