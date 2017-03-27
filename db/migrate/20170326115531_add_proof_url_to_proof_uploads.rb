class AddProofUrlToProofUploads < ActiveRecord::Migration[5.0]
  def change
    add_column :proof_uploads, :proof_url, :string
  end
end
