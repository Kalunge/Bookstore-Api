class Book < ApplicationRecord
  validates :author, presence: true, length: { minimum: 3 }

  belongs_to :author
end
