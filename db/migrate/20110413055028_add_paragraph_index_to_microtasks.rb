class AddParagraphIndexToMicrotasks < ActiveRecord::Migration
  def self.up
    add_column :microtasks, :paragraph_index, :integer
  end

  def self.down
    remove_column :microtasks, :paragraph_index
  end
end
