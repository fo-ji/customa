class Minute < ApplicationRecord
  belongs_to :clients
  mount_uploader :file, FileUploader
end
