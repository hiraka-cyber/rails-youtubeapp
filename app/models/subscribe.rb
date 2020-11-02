class Subscribe < ApplicationRecord
  belongs_to :subscriber, class_name: "User"
  belongs_to :subscribe, class_name: "User"
  validates :subscriber_id, presence: true
  validates :subscribe_id, presence: true
end
