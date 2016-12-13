class Comment < ApplicationRecord
	belongs_to :micropost
	belongs_to :user
	validates :micropost_id, presence: true
	validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  default_scope -> { order(created_at: :desc) }
end
