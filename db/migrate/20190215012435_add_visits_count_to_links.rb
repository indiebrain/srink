class AddVisitsCountToLinks < ActiveRecord::Migration[5.2]
  def change
    add_column :links, :visits_count, :integer
  end
end
