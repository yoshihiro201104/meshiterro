class PostImage < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/image/image/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end

  before_create :set_created_at
  before_save :set_updated_at

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  private
  def set_created_at
    self.created_at = Time.now
  end

  def set_updated_at
    self.updated_at = Time.now
  end
end
