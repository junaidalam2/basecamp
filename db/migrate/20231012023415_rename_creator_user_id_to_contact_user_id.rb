class RenameCreatorUserIdToContactUserId < ActiveRecord::Migration[7.0]
  def change
    rename_column :issues, :creator_user_id, :contact_user_id
  end
end
