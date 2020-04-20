class Quotation < ApplicationRecord
  belongs_to :client
  has_many :documents

  validates :name, presence: true

  accepts_nested_attributes_for :documents
end
