class Ticket < ApplicationRecord
  before_create :generate_ticket_number

  belongs_to :customer
  has_many_attached :images

  private
    def generate_ticket_number
      self.ticket_number = "TKT - #{SecureRandom.hex(4).upcase}"
    end

end
