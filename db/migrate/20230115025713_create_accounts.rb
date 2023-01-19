class CreateAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :accounts do |t|
      t.references :user, foreign_key: true
      t.float :balance, default: 0.0
      t.references :bank, foreign_key: true
      t.string :agency_number
      t.string :account_number

      t.timestamps
    end
  end
end
