class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: ["Fiction", "Non-Fiction"] }
  validate :is_clickbait?

  def is_clickbait?
    if !["Won't Believe", "Secret", "Top", "Guess"].any? {|word| title.to_s.include?(word)}
      errors.add(:title, "Not clickbait enough")
    end
  end

end
