class AddMatchedUserIdsToMatches < ActiveRecord::Migration[5.0]
  def change
    add_column :matches, :matched_user_ids, :integer, array: true
  end
end
