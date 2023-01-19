class RemoveAccountNumberFromAccounts < ActiveRecord::Migration[5.2]
  def change
    remove_column :accounts, :account_number, :integer
  end
end
