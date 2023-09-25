class AddIssueIdToComment < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :issue_id, :integer
    add_index :comments, :issue_id
  end
end
