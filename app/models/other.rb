class Other < ApplicationRecord
  belongs_to :clients
  has_many :documents

  accepts_nested_attributes_for :documents
end
