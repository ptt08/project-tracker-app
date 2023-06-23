class SetDefaultValueForDescriptionOnCards < ActiveRecord::Migration[7.0]
  def change
    change_column :comments, :content, :text, default: ''
  end
end
