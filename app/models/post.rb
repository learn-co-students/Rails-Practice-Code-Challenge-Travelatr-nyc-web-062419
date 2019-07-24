class Post < ApplicationRecord
    belongs_to :destination
    belongs_to :blogger
    validate :content_validator

    def content_validator
        if self.content == nil
            errors.add(:content, "can't be blank")
        elsif self.content.length < 100
            errors.add(:content, "must be  minimum of 100 characters long.")
        end
    end
end
