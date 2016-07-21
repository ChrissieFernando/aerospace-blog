class Article < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :article_categories
  has_many :categories, through: :article_categories
  validates :title, presence: true, length: { minimum: 3, maximum: 50 }
  validates :description, presence: true, length: { minimum: 10 }
  validates :user_id, presence: true
  mount_uploader :files, FilesUploader
  validate :files_size

  private

  def files_size
    if files.size > 10.megabytes
      errors.add(:files, "should be less than 10MB")
    end
  end
end
