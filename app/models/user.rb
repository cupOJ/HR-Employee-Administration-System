class User < ApplicationRecord
    validates :name, presence: true
    validates :email, presence: true, uniqueness: { case_sensitive: false }, length: {maximum: 512}, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :password, length: {minimum: 5, maximum: 30}, confirmation: true
    validates :password_confirmation, presence: true
end
