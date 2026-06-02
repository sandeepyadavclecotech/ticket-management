class Ticket < ApplicationRecord
  before_create :generate_ticket_number

  validates :title, presence: true
  validates :description, presence: true, length: { minimum: 8 }
  validates :status, presence: true
  validates :priority, presence: true

  belongs_to :customer
  has_many_attached :images

  has_many :comments, dependent: :destroy

  private
    def generate_ticket_number
      self.ticket_number = "TKT - #{SecureRandom.hex(4).upcase}"
    end

end

