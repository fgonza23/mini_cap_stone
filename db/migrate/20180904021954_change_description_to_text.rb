class ChangeDescriptionToText < ActiveRecord::Migration[5.2]
  def change
    change_column :product, :description, :text
  end
end
