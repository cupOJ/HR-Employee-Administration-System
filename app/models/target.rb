class Target < ApplicationRecord
    validates :title, presence: true, length: {minimum: 1, maximum: 64}, format: { with: /\A[a-zA-Z\s]+\z/,
        message: "only allows letters"}
    validates :description, presence: true, length: {minimum: 1, maximum: 256}

    validates :team_id, presence: true, length: {minimum: 1, maximum:1}, format: { with: /\A[0-9]+\z/,
        message: "only allows numbers"}
    validates :status, presence: true, length: {minimum: 1, maximum:1}, format: { with: /\A[0-9]+\z/,
        message: "only allows numbers"}
    
    belongs_to :team, foreign_key: 'team_id'
end
