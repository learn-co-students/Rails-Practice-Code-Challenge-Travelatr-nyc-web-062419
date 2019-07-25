class Blogger < ApplicationRecord
 has_many :posts
 has_many :destinations, through: :posts
 validates :name, uniqueness: true
 validate :age_limit, :word_count


 def age_limit
    if self.age < 1
        errors.add(:age, "has to be more than 0.")
    end
 end

 def word_count
    if self.bio.size < 30
        errors.add(:bio, "must be more than 30 characters. #{30 - self.bio.size} characters remaining.")
    end
 end
end
