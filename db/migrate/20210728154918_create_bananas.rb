class CreateBananas < ActiveRecord::Migration[5.2]
  def up
    execute 'CREATE SCHEMA banana'
    create_table :bananas do |t|
      # Types
      t.timestamps
    end
  end

  def down
    drop_table :bananas
    execute 'DROP SCHEMA banana'
  end
end
