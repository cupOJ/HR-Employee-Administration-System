class DeleteAttr < ActiveRecord::Migration[7.0]
  def change
    remove_column :targets, :attr
  end
end
