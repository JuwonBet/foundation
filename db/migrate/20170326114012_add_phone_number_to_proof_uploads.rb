class AddPhoneNumberToProofUploads < ActiveRecord::Migration[5.0]
  def change
    add_column :proof_uploads, :phone_number, :string
  end
end
