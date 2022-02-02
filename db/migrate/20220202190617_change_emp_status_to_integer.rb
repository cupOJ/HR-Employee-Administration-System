class ChangeEmpStatusToInteger < ActiveRecord::Migration[7.0]
  def change
    change_column :employees, :employment_status, :integer
  end
end
