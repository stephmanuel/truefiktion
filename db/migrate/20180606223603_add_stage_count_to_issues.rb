class AddStageCountToIssues < ActiveRecord::Migration[5.0]
  def change
    add_column :issues, :stages_count, :integer
  end
end
