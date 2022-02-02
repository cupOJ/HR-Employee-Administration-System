class Employee < ApplicationRecord
    validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :name, presence: true, length: {minimum: 1, maximum: 64}, format: { with: /\A[a-zA-Z]+\z/,
        message: "only allows letters"}
    validates :job, presence: true, length: {minimum: 1, maximum: 64}, format: { with: /\A[a-zA-Z0-9]+\z/,
        message: "only allows letters and numbers"}
    validates :salary, presence: true, length: {minimum: 1, maximum:2}, format: { with: /\A[0-9]+\z/,
        message: "only allows numbers"}
    validates :employment_status, presence: true, length: {minimum: 1, maximum: 64}, format: { with: /\A[a-zA-Z]+\z/,
        message: "only allows letters"}
    validates :team_id, presence: true, length: {minimum: 1, maximum:2}, format: { with: /\A[0-9]+\z/,
        message: "only allows numbers"}
    
    has_one: team
end
