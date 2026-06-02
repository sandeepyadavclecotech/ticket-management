class Comment < ApplicationRecord
  validate :content, presence: true
  belongs_to :ticket
  belongs_to :customer
end
