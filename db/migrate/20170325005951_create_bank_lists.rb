class CreateBankLists < ActiveRecord::Migration[5.0]
  def change
    create_table :bank_lists do |t|
      t.string :name
      t.string :description
      t.string :thumb_url

      t.timestamps
    end
  end
end
