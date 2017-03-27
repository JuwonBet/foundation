class RemoveMatchedUserIdsFromMatches < ActiveRecord::Migration[5.0]
  def change
    remove_column :matches, :matched_user_ids, :integer
  end
end
