class Client < ApplicationRecord
  belongs_to :user
  validates :company_name, :responsible_party, :address, :postal_code, :phone_number, :email, :user_id, presence: true
  validates :postal_code, format: { with: /\A\d{3}[-]\d{4}$|^\d{3}[-]\d{2}$|^\d{3}\z/ }
end