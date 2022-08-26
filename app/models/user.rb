class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum user_status: { voter: 0, candidate: 1, admin: 2, super_admin: 3}

  validates :name, :presence => true
  validates :email, :uniqueness => true, :presence => true
  validates :cnic, :uniqueness => true, :presence => true, :length => { :is => 13 }


  has_one_attached :avatar
  has_one_attached :image
  belongs_to :constituency
end
