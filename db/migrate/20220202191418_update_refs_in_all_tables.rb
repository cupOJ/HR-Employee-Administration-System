class UpdateRefsInAllTables < ActiveRecord::Migration[7.0]
  def change
    remove_column :employees, :team_id
    remove_column :teams, :team_lead
    remove_column :teams, :division_id
    remove_column :targets, :team_id
    remove_column :divisions, :manager_id

    add_reference(:employees, :team, foreign_key: true)
    add_reference(:teams, :division, foreign_key: true)
    add_reference(:targets, :team, foreign_key: true)
    add_reference(:teams, :team_lead, index: { unique: true }, foreign_key: { to_table: :employees })
    add_reference(:divisions, :manager, index: { unique: true }, foreign_key: { to_table: :employees })
  end
end
