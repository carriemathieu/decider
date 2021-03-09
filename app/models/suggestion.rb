class Suggestion < ApplicationRecord
    belongs_to :task
    belongs_to :user

    validates :content, presence: true
    validates :task, uniqueness: {scope: :user_id, message: "may only have one suggestion per user."}
end
