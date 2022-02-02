class Team < ApplicationRecord
    validates :name, presence: true, length: {minimum: 1, maximum: 64}, format: { with: /\A[a-zA-Z]+\z/,
        message: "only allows letters"}
    validates :description, length: {maximum: 256}
    validates :team_lead, presence: true, length: {minimum: 1, maximum:2}, format: { with: /\A[0-9]+\z/,
        message: "only allows numbers"}
    validates :division_id, presence: true, length: {minimum: 1, maximum:2}, format: { with: /\A[0-9]+\z/,
        message: "only allows numbers"}
    
    has_many :employees
    has_many :divisions
    has_many :targets
    has_one :employee, through :team_lead
end
