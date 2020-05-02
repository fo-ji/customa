class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :quotation, optional: true
  belongs_to :minute,    optional: true
  belongs_to :other,     optional: true
end
