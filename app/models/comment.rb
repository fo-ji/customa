class Comment < ApplicationRecord
  belongs_to :quotation
  belongs_to :minute
  belongs_to :other
  
  validates :comment, presence: true
end
