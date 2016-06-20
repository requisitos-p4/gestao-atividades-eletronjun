class User < ActiveRecord::Base

  has_many :admin_boards, :foreign_key => "admin_id", :class_name => "Board"

  before_save { self.email = email.downcase }

  VALID_EMAIL = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name, presence: true, length: { maximum: 60 }
  validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL }, uniqueness: { case_sensitive: false }

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

  # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

end
