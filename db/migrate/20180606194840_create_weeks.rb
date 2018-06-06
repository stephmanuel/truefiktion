class CreateWeeks < ActiveRecord::Migration
  def change
    create_table :weeks do |t|
      t.integer :stage_id
      t.integer :issue_id
      t.string :weeks

      t.timestamps

    end
  end
end
