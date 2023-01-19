class CreateBanks < ActiveRecord::Migration[5.2]
  def change
    create_table :banks do |t|
      t.string :description
      t.string :compe
      t.string :image

      t.timestamps
    end
  end
end
