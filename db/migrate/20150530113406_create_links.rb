class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.text :url, null: :false
      t.text :token

      t.timestamps null: false
    end
  end
end
