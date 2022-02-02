class Target < ApplicationRecord
    validates :name, presence: true, length: {minimum: 1, maximum: 64}, format: { with: /\A[a-zA-Z]+\z/,
        message: "only allows letters"}
    validates :description, presence: true, length: {minimum: 1, maximum: 256}, format: { with: /\A[a-zA-Z0-9]+\z/,
        message: "only allows letters and numbers"}
    validates :team_id, presence: true, length: {minimum: 1, maximum:2}, format: { with: /\A[0-9]+\z/,
        message: "only allows numbers"}
    validates :status, presence: true, length: {minimum: 1, maximum:2}, format: { with: /\A[0-9]+\z/,
        message: "only allows numbers"}
    
    has_one: team
end
