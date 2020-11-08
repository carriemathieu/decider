class Task < ApplicationRecord
    belongs_to :user
    has_many :suggestions
    has_many :users, through: :suggestions
end
