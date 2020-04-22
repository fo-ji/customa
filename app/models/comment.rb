class Comment < ApplicationRecord
  belongs_to :quotation, optional: true
  belongs_to :minute,    optional: true
  belongs_to :other,     optional: true

  validates :comment, presence: true
end
