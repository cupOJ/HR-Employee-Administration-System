class Team < ApplicationRecord
    validates :name, presence: true, length: {minimum: 1, maximum: 64}, format: { with: /\A[a-zA-Z\s]+\z/,
        message: "only allows letters"}
    validates :description, length: {maximum: 256}
    validates :team_lead_id, presence: true, length: {minimum: 1, maximum:1}, format: { with: /\A[0-9]+\z/,
        message: "only allows numbers"}
    validates :division_id, presence: true, length: {minimum: 1, maximum:1}, format: { with: /\A[0-9]+\z/,
        message: "only allows numbers"}
    
    has_many :employees
    has_many :targets
    belongs_to :team_lead, class_name: 'Employee', foreign_key: 'team_lead_id'
    belongs_to :division, foreign_key: 'division_id'
end
