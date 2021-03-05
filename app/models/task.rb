class Task < ApplicationRecord
    belongs_to :user
    has_many :suggestions
    has_many :users, through: :suggestions
    validates :content, presence: true

    # scope :most_suggestions, -> {joins(:suggestions).group('task.id').order('count(tasks.id) desc')}
end
