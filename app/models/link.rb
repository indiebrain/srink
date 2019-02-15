class Link < ApplicationRecord
  validates(
    :url,
    presence: true,
    url: true
  )

  has_many :visits
  belongs_to :user
end
