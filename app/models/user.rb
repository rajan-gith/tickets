class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :role

  scope :admins, -> () { where(role: Role.find_by(name: 'admin')) }
  scope :users, -> () { where(role: Role.find_by(name: 'user')) }

  def admin?
    self.role.name == 'admin'
  end
end
