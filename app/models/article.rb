class Article < ApplicationRecord
	searchkick
	  mount_uploader :image, ArticleImageUploader
	  validates :title, presence: true
	  validates :description, presence: true
  	  validates :image, presence: true
	  belongs_to :category
	  belongs_to :user
	  has_many :likes, dependent: :destroy
	  has_many :comments,dependent: :destroy

	  def is_liked(user)
	  	Like.where(user_id: user.id, article_id: id)
	  end

  def search_data
    {
      title: title,
      description: description,
      category: category.name
    }
  end

  def self.generate_title_pdf user
  	Article.where(user_id: user.id)
  end

end
