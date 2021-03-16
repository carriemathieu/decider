class Friendship < ApplicationRecord
    belongs_to :user
    belongs_to :friend, :class_name => "User" # uses User model for association since friend model does not exist
   

end