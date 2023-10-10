class ChangeAssignedToToBeIntegerInIssues < ActiveRecord::Migration[7.0]
  def change
    change_column :issues, :assigned_to, :integer
  end
end
