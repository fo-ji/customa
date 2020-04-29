class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :quotation
  belongs_to :minute
  belongs_to :other
end
