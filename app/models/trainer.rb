class Trainer < ActiveRecord::Base
    has_secure_password
    has_many :pokemon, dependent: :destroy
    validates :username, presence: true, uniqueness: { case_sensitive: false }
    validates :email, presence: true, uniqueness: { case_sensitive: false }
    validates :password, presence: true,  :if => :password

    def add_candy
        self.candy ? self.update_attribute(:candy, self.candy + 5000) : self.update_attribute(:candy, 5000)
    end

    def add_pokeballs
        self.candy ? self.update_attribute(:pokeballs, self.pokeballs + 5) : self.update_attribute(:pokeballs, 5)
    end
end

