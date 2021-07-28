class CreateApples < ActiveRecord::Migration[5.2]
  def up
    create_table :apples do |t|
      # Types
      t.timestamps
    end
  end

  def down
    drop_table :apples
  end
end
