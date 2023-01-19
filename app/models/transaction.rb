class Transaction < ApplicationRecord
  belongs_to :account, dependent: :destroy

  validates :amount, :account_id, presence: true
  
end
