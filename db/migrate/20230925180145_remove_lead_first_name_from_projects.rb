class RemoveLeadFirstNameFromProjects < ActiveRecord::Migration[7.0]
  def change
    remove_column :projects, :lead_first_name, :string
  end
end
