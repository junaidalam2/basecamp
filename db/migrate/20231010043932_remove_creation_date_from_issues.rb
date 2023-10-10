class RemoveCreationDateFromIssues < ActiveRecord::Migration[7.0]
  def change
    remove_column :issues, :creation_date
  end
end
