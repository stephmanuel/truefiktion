class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.integer :user_id
      t.string :name

      t.timestamps

    end
  end
end
