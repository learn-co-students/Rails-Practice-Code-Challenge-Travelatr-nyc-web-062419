class Blogger < ApplicationRecord
    has_many :posts
    has_many :destinations, through: :posts
    validates :name, uniqueness: {case_sensitive: false}
    validate :age_check, :bio_length

    def age_check
        if age <= 0
            errors.add(:age, "must be greater than 0.")
        end
    end

    def bio_length
        if bio.length <= 30
            errors.add(:bio, "must be over 30 characters long.")
        end
    end
end
