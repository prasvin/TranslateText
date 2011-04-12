class CreateMicrotasks < ActiveRecord::Migration
  def self.up
    create_table :microtasks do |t|
      t.integer :task_id
      t.integer :translator_id
      t.float :points
      t.text :paragraph

      t.timestamps
    end
  end

  def self.down
    drop_table :microtasks
  end
end
