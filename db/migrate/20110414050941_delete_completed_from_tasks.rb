class DeleteCompletedFromTasks < ActiveRecord::Migration
  def self.up
    remove_column :tasks, :completed
  end

  def self.down
    add_column :tasks, :completed, :float, :default => 0
  end
end
