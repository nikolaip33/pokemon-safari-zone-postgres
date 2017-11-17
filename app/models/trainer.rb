class Trainer < ActiveRecord::Base
    has_secure_password
    has_many :pokemon
    validates :username, presence: true
    validates :email, presence: true
    validates :password, presence: true

    def full_name
        last_name ? "#{first_name} #{last_name}" : first_name
    end
end