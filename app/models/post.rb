class Post < ApplicationRecord
    belongs_to :destination
    belongs_to :blogger
    validates :title, presence: true
    validate :word_count

    def word_count
        if self.content.size < 100
            errors.add(:content, "must be more than 100 characters. #{100 - self.content.size} characters remaining.")
        end
     end
end
