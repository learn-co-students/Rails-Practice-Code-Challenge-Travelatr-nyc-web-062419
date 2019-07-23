class Post < ApplicationRecord
    belongs_to :blogger
    belongs_to :destination
    validates :title, presence: true
    validate :content_length

    def content_length
        if content.length <= 100 
            errors.add(:content, "must be longer than 100 characters.")
        end
    end
end
