class Account < ApplicationRecord
  belongs_to :user
  belongs_to :bank

  has_many :transactions, dependent: :delete_all
  validates :balance, :account_number, :agency_number, :user_id, presence: true

end
