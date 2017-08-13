class Sample < ApplicationRecord
  validates :title, presence: true, length: { maximum: 30 }
  validates :data, length: { maximum: 50 }
end
