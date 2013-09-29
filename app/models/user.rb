class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  GUEST = 'guest'
  USER  = 'user'
  ADMIN = 'admin'
  ROLES = [GUEST, USER, ADMIN]

  validates :role, inclusion: {in: ROLES}
  validates :username, presence: true, uniqueness: true
end
