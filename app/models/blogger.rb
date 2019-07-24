class Blogger < ApplicationRecord
    has_many :posts
    has_many :destinations, through: :posts
    validates :name, uniqueness: true
    validates :age, numericality: {greater_than: 0}
    validate :bio_validator
    
    def bio_validator
        if self.bio == nil
            errors.add(:bio, "can't be blank")
        elsif self.bio.length < 30
            errors.add(:bio, "must be  minimum of 30 characters long.")
        end
    end
    
end
