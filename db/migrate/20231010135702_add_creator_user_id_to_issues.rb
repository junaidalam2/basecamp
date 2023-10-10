class AddCreatorUserIdToIssues < ActiveRecord::Migration[7.0]
  def change
    add_column :issues, :creator_user_id, :integer
  end
end
