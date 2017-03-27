class AddAccountNumberToProofUploads < ActiveRecord::Migration[5.0]
  def change
    add_column :proof_uploads, :account_number, :string
  end
end
