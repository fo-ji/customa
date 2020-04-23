class Other < ApplicationRecord
  belongs_to :client
  has_many :documents
  has_many :comments

  validates :name, presence: true
  
  accepts_nested_attributes_for :documents
end
