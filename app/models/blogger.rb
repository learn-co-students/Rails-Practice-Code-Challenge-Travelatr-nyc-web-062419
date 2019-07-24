class Blogger < ApplicationRecord
    has_many :posts
    has_many :destinations, through: :posts
    validates :name, uniqueness: true
    validates :age, numericality:{greater_than: 0}
    validate :valid_bio

    def valid_bio
        if self.bio.split.length < 30 
            errors.add(:bio, "must be longer than 30 words holmes.")
        end
    end
end
