class User < ApplicationRecord
    has_secure_password
    validates :email, uniqueness: true
    has_many :tasks
    has_many :tasks, through: :suggestions
    has_many :friendships
    has_many :friends, :through => :friendships
    has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id" # other side of friendship association
    has_many :inverse_friends, :through => :inverse_friendships, :source => :user # so that it will fetch information from user (owner of friendship)

    #def self.from_omniauth(auth)
     #   where(email: auth.info.email).first_or_initialize do |user|
      #      user.email = auth.info.email
      #      user.password = SecureRandom.hex
      #  end
    # end
end
