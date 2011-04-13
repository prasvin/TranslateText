class AddTranslatedParagraphToMicrotasks < ActiveRecord::Migration
  def self.up
    add_column :microtasks, :translated_paragraph, :text
  end

  def self.down
    remove_column :microtasks, :translated_paragraph
  end
end
