class AddCreatorUserIdToProjects < ActiveRecord::Migration[7.0]
  def change
    add_column :projects, :creator_user_id, :integer
  end
end
