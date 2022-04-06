     class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: {in: ["Fiction", "Non-Fiction"]}
    # validates :title, exclusion: {in: ["True Facts"]}

    validate :clickbait

    def clickbait
        if [/Won't Believe | Secret | Guess | Top /].none? {|exp| exp.match(title)}
            errors.add(:title, "needs to be more clickbait-y")
        end
    end

end
