class CreateTeams < ActiveRecord::Migration[7.0]
  def change
    create_table :teams do |t|
      t.string :name
      t.string :description
      t.integer :team_lead
      t.integer :division_id

      t.timestamps
    end
  end
end
