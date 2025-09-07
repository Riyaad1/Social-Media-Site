class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  after_create_commit { broadcast_prepend_to [ post, :comments ], target: "comments" }

  validates :content, presence: true, length: { maximum: 1000 }
end
