class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #validates_presence_of :email
  #validates_presence_of :password
  #validates_presence_of :confirmation_password

  validates_uniqueness_of :email
  validates_uniqueness_of :auth_token

  def info
    "#{email} - #{created_at} - Token: #{Devise.friendly_token}"
  end
end
