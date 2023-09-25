class AddProjectIdToIssue < ActiveRecord::Migration[7.0]
  def change
    add_column :issues, :project_id, :integer
    add_index :issues, :project_id
  end
end
