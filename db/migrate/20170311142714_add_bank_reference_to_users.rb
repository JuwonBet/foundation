class AddBankReferenceToUsers < ActiveRecord::Migration[5.0]
  def change
  	add_reference :users, :bank, index: true, foreign_key: true
  end
end
