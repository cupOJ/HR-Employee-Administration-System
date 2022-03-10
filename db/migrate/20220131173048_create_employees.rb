class CreateEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :employees do |t|
      t.string :email
      t.string :name
      t.string :job
      t.float :salary
      t.string :employment_status
      t.integer :team_id

      t.timestamps
    end
  end
end
