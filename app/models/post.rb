class Post < ActiveRecord::Base

  validates :cafe_name, :city, :state, :description, { presence: true }
  belongs_to :user

  has_many :likes
  has_many :likers, through: :likes, source: :user

  def like_count
    self.likes.count
  end
end
