class Document < ApplicationRecord
  belongs_to :quotation
  belongs_to :minutes
  belongs_to :other

  mount_uploader :document, FileUploader

  validates :document, presence: true
end
