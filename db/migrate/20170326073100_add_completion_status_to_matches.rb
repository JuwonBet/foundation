class AddCompletionStatusToMatches < ActiveRecord::Migration[5.0]
  def change
    add_column :matches, :completion_status, :string
  end
end
