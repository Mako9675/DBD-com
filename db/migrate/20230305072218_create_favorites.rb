class CreateFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :favorites do |t|
      t.integer :user,              null: false, default: "", foreign_key: true
      t.integer :post,              null: false, default: "", foreign_key: true
      t.timestamps
    end
  end
end
