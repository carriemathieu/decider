class User < ApplicationRecord
    has_secure_password
    validates :email, uniqueness: true
    validates :email, :password, presence: true
    has_many :tasks
    has_many :suggestions
    has_many :suggestions_added, through: :tasks, source: :task # connects user to task through suggestions join table (has_many :suggestions through :comments)
    has_many :friendships
    has_many :friends, :through => :friendships
    has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id" # other side of friendship association
    has_many :inverse_friends, :through => :inverse_friendships, :source => :user # so that it will fetch information from user (owner of friendship)

    scope :alpha, -> { order(:firstname) }

    def self.from_omniauth(auth)
        where(email: auth.info.email).first_or_initialize do |user|
            user.firstname = auth["info"]["first_name"]
            user.lastname = auth["info"]["lastname"]
            user.password = SecureRandom.hex
        end
    end

    def self.search(params)
        where("LOWER(firstname) LIKE :name OR LOWER(lastname) LIKE :name", name: "%#{params}%") # selects * from DB where firstname = params, converts all firstname column to lowercase
    end
end
