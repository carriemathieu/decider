class Task < ApplicationRecord
    belongs_to :user
    has_many :suggestions
    has_many :users, through: :suggestions
    validates :content, presence: true
    
    # scope :most_suggestions, -> 
    # {left_join(:suggestions) // joins suggestions & tasks tables (left join will give ALL tasks where joins will give only tasks that have suggestions)
    # .group('task.id') // groups together by task.id (otherwise you might have Task id "1" 3 times)
    # .order('count // orders each group by count
    # (tasks.id) // tells what to count (if just id, unclear whether tasks or suggestion id)
    # desc')} // starts w/ highest to lowest
    
end
