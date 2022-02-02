class Division < ApplicationRecord
    validates :name, presence: true, length: {minimum: 1, maximum: 64}, format: { with: /\A[a-zA-Z]+\z/,
        message: "only allows letters"}
    validates :description, length: {maximum: 256}
    validates :manager_id, presence: true, length: {minimum: 1, maximum:2}, format: { with: /\A[0-9]+\z/,
        message: "only allows numbers"}
    
    belongs_to :manager, class_name: 'Employee', foreign_key: 'manager_id'
    has_many :teams
end
