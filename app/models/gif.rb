class Gif < ApplicationRecord
  has_many :likes
  has_many  :words, through: :likes
  has_many :results
  has_many :searches, through: :results


end
