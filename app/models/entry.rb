class Entry < ApplicationRecord
  belongs_to :account
  belongs_to :result_center
  validates :date, presence: true
  validates :value, presence: true
  validates :account, presence: true
  validates :result_center, presence: true
  validates :memo, presence: false
end
