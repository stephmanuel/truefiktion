class CreateMedia < ActiveRecord::Migration
  def change
    create_table :media do |t|
      t.integer :week_id
      t.integer :stage_id
      t.string :article
      t.string :video

      t.timestamps

    end
  end
end
