class CreateTasks < ActiveRecord::Migration
  def self.up
    create_table :tasks do |t|
      t.string :title
      t.text :text
      t.datetime :deadline
      t.integer :requester_id
      t.integer :language_from
      t.integer :language_to
      t.float :completed, :default => 0
      t.float :points

      t.timestamps
    end
  end

  def self.down
    drop_table :tasks
  end
end
