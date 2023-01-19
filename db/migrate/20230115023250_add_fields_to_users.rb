class AddFieldsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :full_name, :string
    add_column :users, :identification, :string
    add_column :users, :birth_date, :date
    add_column :users, :phone, :string
    add_column :users, :phone2, :string
    add_column :users, :andress, :string
  end
end
