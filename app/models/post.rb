class Post < ApplicationRecord
    belongs_to :blogger
    belongs_to :destination

    validate :long_enough
    validates :title, presence: true

    def long_enough
        if self.content.length <= 100
            errors.add(:content, " must be longer than 100 characters.")
        end
    end

end
