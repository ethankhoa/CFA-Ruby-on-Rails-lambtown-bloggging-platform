class User < ApplicationRecord
  after_create :assign_default_role
  rolify :before_add => :before_add_method

  def before_add_method(role)
    # do something before it gets added
  end

  def assign_default_role
  self.add_role(:newuser) if self.roles.blank?
  end

  def set_admin_user
    user = User.find(1)
    user.add_role :admin
  end


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :posts
  has_many :comments
end
