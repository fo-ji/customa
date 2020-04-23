class Other < ApplicationRecord
  belongs_to :client
  has_many   :documents, dependent: :destroy
  has_many   :comments,  dependent: :destroy

  validates :name, presence: true
  
  accepts_nested_attributes_for :documents
end
