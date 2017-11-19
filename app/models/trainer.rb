class Trainer < ActiveRecord::Base
    has_secure_password
    has_many :pokemon
    validates :username, presence: true
    validates :email, presence: true
    validates :password, presence: true
end