class Like < ApplicationRecord
  belongs_to :user
  belongs_to :article
  validates :user_id, uniqueness: {scope: :article_id}
  def self.like_art(user)
  	Like.where(user_id: user.id)
  end
end
