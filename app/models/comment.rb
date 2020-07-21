class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :article
  validates :comment, presence: true

  def self.is_comment user
  	Comment.all.where(user_id: user.id )
  end
end
