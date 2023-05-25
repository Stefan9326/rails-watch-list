class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list

  validates :comment, length: { minimum: 6 }
  # validate that the bookmark is unique for a given movie/list couple
  validates :movie, uniqueness: { scope: :list }
end
