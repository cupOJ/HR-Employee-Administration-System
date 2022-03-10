class CreateDivisions < ActiveRecord::Migration[7.0]
  def change
    create_table :divisions do |t|
      t.string :name
      t.string :description
      t.integer :manager_id

      t.timestamps
    end
  end
end
