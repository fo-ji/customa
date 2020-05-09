class Document < ApplicationRecord
  has_many   :comments,  dependent: :destroy
  has_many   :bookmarks, dependent: :destroy
  belongs_to :client
  belongs_to :user
  
  validates :name,     presence: true, uniqueness: true
  validates :document, :category, presence: true

  mount_uploader :document, FileUploader

  enum category: { 見積書: 0, 議事録: 1, その他: 2 }
end
