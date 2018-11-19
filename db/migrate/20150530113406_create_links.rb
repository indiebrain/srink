class CreateLinks < ActiveRecord::Migration[5.0]
  def change
    create_table :links do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.text :url, null: :false
      t.text :token

      t.timestamps null: false
    end

    add_index :links, :token, unique: true
  end
end
