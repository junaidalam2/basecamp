class RemoveTargetResolutionDateFromIssues < ActiveRecord::Migration[7.0]
  def change
    remove_column :issues, :target_resolution_date
  end
end
