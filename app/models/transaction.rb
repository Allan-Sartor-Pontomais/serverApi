class Transaction < ApplicationRecord
  validates :title, presence: true
  validates :typing, presence: true
  validates :category, presence: true
  validates :amount, presence: true
end
