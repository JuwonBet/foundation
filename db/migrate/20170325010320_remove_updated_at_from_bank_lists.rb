class RemoveUpdatedAtFromBankLists < ActiveRecord::Migration[5.0]
  def change
    remove_column :bank_lists, :updated_at, :timestamp
  end
end
