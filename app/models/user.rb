class User < ApplicationRecord
    has_secure_password
    has_many :tasks
    has_many :suggestions, through: :tasks
    has_many :friendships
    has_many :friends, :through => :friendships
    has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
    has_many :inverse_friends, :through => :inverse_friendships, :source => :user
end
