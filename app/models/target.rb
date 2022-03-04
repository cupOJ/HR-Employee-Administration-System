class Target < ApplicationRecord
    validates :title, presence: true, length: {minimum: 1, maximum: 64}, format: { with: /\A[a-zA-Z\s]+\z/,
        message: "only allows letters"}
    validates :description, presence: true, length: {minimum: 1, maximum: 256}
    validates :start_date, presence: true
    validates :finish_date, presence: true
    validate :finish_date_after_start_date?
    validates :team_id, presence: true, length: {minimum: 1, maximum:1}, format: { with: /\A[0-9]+\z/,
        message: "only allows numbers"}
    validates :status, presence: true, length: {minimum: 1, maximum:1}, format: { with: /\A[0-9]+\z/,
        message: "only allows numbers"}
    
    belongs_to :team, foreign_key: 'team_id'
end

def finish_date_after_start_date?
  if (finish_date || 0) < (start_date || 0)
    errors.add :finish_date, "must be after start date"
  end
end