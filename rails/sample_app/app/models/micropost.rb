class Micropost < ActiveRecord::Base
  validates :content, presence: true, length: { maximum: 140 }
  validates :user_id, presence: true

  belongs_to :user
  default_scope -> { order('created_at DESC') }
end