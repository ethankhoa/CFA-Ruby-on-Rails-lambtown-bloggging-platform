class Post < ApplicationRecord
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged
  belongs_to :user
  has_many :comments

  def slug_candidates
    [
      :title,
      [:title, :content]
    ]
  end

end
