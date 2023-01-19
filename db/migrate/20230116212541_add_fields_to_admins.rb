class AddFieldsToAdmins < ActiveRecord::Migration[5.2]
  def change
    add_column :admins, :full_name, :string
    add_column :admins, :identification, :string
    add_column :admins, :phone, :string
    add_column :admins, :birth_date, :date
    add_column :admins, :andress, :string
    add_column :admins, :uf, :integer
  end
end
