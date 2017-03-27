class RemoveCreatedAtFromPackages < ActiveRecord::Migration[5.0]
  def change
    remove_column :packages, :created_at, :timestamp
  end
end
