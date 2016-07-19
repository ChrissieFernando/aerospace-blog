class Comment < ActiveRecord::Base
  belongs_to :article
  belongs_to :user
  validates :comment, presence: true, length: { minimum: 3 }
  # validates :userid, presence: true
end
