class Word < ApplicationRecord
  has_many  :searches
  has_many  :results, through: :searches
  has_many  :likes
  has_many  :gifs, through: :likes


end
