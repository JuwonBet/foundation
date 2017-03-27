class CreatePackages < ActiveRecord::Migration[5.0]
  def change
    create_table :packages do |t|
      t.string :name
      t.string :description
      t.decimal :price

      t.timestamps
    end
  end
end
