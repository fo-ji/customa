class Document < ApplicationRecord
  belongs_to :quotation, optional: true
  belongs_to :minute,    optional: true
  belongs_to :other,     optional: true

  mount_uploader :document, FileUploader

  validates :document, presence: true
end
