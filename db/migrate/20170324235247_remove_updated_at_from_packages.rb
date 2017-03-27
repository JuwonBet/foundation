class RemoveUpdatedAtFromPackages < ActiveRecord::Migration[5.0]
  def change
    remove_column :packages, :updated_at, :timestamp
  end
end
