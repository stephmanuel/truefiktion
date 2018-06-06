class AddWeekCountToStages < ActiveRecord::Migration[5.0]
  def change
    add_column :stages, :weeks_count, :integer
  end
end
