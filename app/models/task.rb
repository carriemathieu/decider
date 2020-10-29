class Task < ApplicationRecord
    has_many :suggestions
    has_many :users, through: :suggestions
end
