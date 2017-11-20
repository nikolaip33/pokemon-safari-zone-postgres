class Trainer < ActiveRecord::Base
    has_secure_password
    has_many :pokemon
    validates :username, presence: true, uniqueness: { case_sensitive: false }
    validates :email, presence: true, uniqueness: { case_sensitive: false }
    validates :password, presence: true,  :if => :password

    def add_candy
        self.candy ? self.update_attribute(:candy, self.candy + 25000) : self.update_attribute(:candy, 25000)
    end
end

