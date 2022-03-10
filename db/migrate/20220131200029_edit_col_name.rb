class EditColName < ActiveRecord::Migration[7.0]
  def change
    rename_column :targets, :attribute, :attr
  end
end
