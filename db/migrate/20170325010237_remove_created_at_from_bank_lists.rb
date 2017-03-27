class RemoveCreatedAtFromBankLists < ActiveRecord::Migration[5.0]
  def change
    remove_column :bank_lists, :created_at, :timestamp
  end
end
