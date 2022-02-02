class User < ApplicationRecord
    validates :name, presence: true
    validates :email, presence: true, uniqueness: { case_sensitive: false }, length: {maximum: 512}
    validates :password, presence: true, length: {minimum: 5, maximum: 30}
end
