class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  mount_uploader :image, ImageUploader
  validates :profile, length: { maximum: 200 }
  has_many :movies
  has_many :likes, dependent: :destroy
  has_many :liked_movies, through: :likes, source: :movie
  has_many :subscribe_subscribes, foreign_key: "subscriber_id", class_name: "Subscribe", dependent: :destroy
  has_many :subscribes, through: :subscribe_subscribes
  has_many :subscriber_subscribes, foreign_key: "subscribe_id", class_name: "Subscribe", dependent: :destroy
  has_many :subscribers, through: :subscriber_subscribes
  def already_liked?(movie)
    self.likes.exists?(movie_id: movie.id)
  end

  def subscribe?(other_user)
    subscribe_subscribes.find_by(subscribe_id: other_user.id)
  end

  def subscribe!(other_user)
    subscribe_subscribes.create!(subscribe_id: other_user.id)
  end

  def unsubscribe!(other_user)
    subscribe_subscribes.find_by(subscribe_id: other_user.id).destroy
  end
end
