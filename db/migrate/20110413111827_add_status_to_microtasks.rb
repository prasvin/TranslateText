class AddStatusToMicrotasks < ActiveRecord::Migration
  def self.up
    add_column :microtasks, :status, :string, :default => "Open"
  end

  def self.down
    remove_column :microtasks, :status
  end
end
