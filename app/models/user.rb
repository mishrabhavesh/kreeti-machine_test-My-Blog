class User < ApplicationRecord
	has_many :articles,dependent: :destroy
	belongs_to :role
	has_many :likes,dependent: :destroy
	has_many :comments,dependent: :destroy
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 105},
              format: { with: VALID_EMAIL_REGEX }
    validates_uniqueness_of :email
    has_secure_password
end
