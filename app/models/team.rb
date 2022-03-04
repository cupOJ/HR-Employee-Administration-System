class Team < ApplicationRecord
    validates :name, presence: true, length: {minimum: 1, maximum: 64}, format: { with: /\A[a-zA-Z\s]+\z/,
        message: "only allows letters"}
    validates :description, length: {maximum: 256}
    validates :team_lead_id, presence: false
    validates :division_id, presence: false
    
    has_many :employees, dependent: :nullify
    has_many :targets, dependent: :destroy
    belongs_to :team_lead, class_name: 'Employee', foreign_key: 'team_lead_id', optional: true
    belongs_to :division, foreign_key: 'division_id', optional: true
end
