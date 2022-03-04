class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

    validates :name, presence: true
    has_one_attached :avatar
    # validates :email, presence: true, uniqueness: { case_sensitive: false }, length: {maximum: 512}, format: { with: URI::MailTo::EMAIL_REGEXP }
    # validates :password, length: {minimum: 5, maximum: 30}, confirmation: true
    # validates :password_confirmation, presence: true
end
