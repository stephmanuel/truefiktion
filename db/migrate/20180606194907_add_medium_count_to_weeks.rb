class AddMediumCountToWeeks < ActiveRecord::Migration[5.0]
  def change
    add_column :weeks, :media_count, :integer
  end
end
