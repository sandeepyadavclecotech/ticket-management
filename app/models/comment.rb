class Comment < ApplicationRecord
  validates :content, presence: true
  belongs_to :ticket
  belongs_to :customer
end
