class Customer < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tickets, dependent: :destroy
  has_many :comments, dependent: :destroy

  enum role: {
    customer: "customer",
    admin: "admin"
  }

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup

    email = conditions.delete(:email)
    phone_no = conditions.delete(:phone_no)

    where(email: email, phone_no: phone_no).first
  end
end
