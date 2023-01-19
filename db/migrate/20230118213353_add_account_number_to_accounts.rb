class AddAccountNumberToAccounts < ActiveRecord::Migration[5.2]
  def change
    add_column :accounts, :account_number, :string
  end
end
