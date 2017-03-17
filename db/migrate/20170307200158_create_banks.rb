class CreateBanks < ActiveRecord::Migration[5.0]
  def change
    create_table :banks do |t|
      t.string :name
      t.string :account_name
      t.string :account_number
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
