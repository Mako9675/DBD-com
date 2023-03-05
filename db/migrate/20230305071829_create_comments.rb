class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.integer :user,              null: false, default: "", foreign_key: true
      t.integer :post,              null: false, default: "", foreign_key: true
      t.string :comment,            null: false, default: ""

      t.timestamps
    end
  end
end
