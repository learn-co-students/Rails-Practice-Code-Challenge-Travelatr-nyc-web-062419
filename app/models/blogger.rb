class Blogger < ApplicationRecord

    has_many :posts
    has_many :destinations, through: :posts

    validates :name, uniqueness: true

    validate :long_enough
    validate :old_enough



    def old_enough
        if self.age<=0
            errors.add(:age, " must be greater than 0.")
        end
    end


    def long_enough
        if self.bio.length <= 30
            errors.add(:bio, " must be longer than 30 characters.")
        end
    end

end
