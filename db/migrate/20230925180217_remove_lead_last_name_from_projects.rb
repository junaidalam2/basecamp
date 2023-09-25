class RemoveLeadLastNameFromProjects < ActiveRecord::Migration[7.0]
  def change
    remove_column :projects, :lead_last_name, :string
  end
end
