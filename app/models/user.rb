class User < ApplicationRecord
    has_secure_password
    validates :email, uniqueness: true
    validates :email, :password, presence: true
    has_many :tasks
    has_many :suggestions
    has_many :suggestions_added, through: :tasks, source: :task
    has_many :friendships
    has_many :friends, :through => :friendships
    has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id" # other side of friendship association
    has_many :inverse_friends, :through => :inverse_friendships, :source => :user # so that it will fetch information from user (owner of friendship)

    scope :alpha, -> { order(:content) }
end
