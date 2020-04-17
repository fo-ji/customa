class Other < ApplicationRecord
  belongs_to :client
  has_many :documents

  accepts_nested_attributes_for :documents
end
