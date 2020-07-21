class Article < ApplicationRecord
	  mount_uploader :image, ArticleImageUploader
	  validates :title, presence: true
	  validates :description, presence: true
	  belongs_to :category
	  belongs_to :user
	  has_many :likes

	  def is_liked(user)
	  	Like.where(user_id: user.id, article_id: id)
	  end

	  
end
