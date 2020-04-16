class Quotation < ApplicationRecord
  belongs_to :clients
  has_many :files

  accepts_nested_attributes_for :files
end
