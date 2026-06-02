class Ticket < ApplicationRecord
  belongs_to :customer
  has_many_attached :images
end
