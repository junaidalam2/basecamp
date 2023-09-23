class CreateIssues < ActiveRecord::Migration[7.0]
  def change
    create_table :issues do |t|
      t.timestamp :creation_date
      t.string :short_description
      t.string :detailed_description
      t.string :steps_to_reproduce
      t.string :status
      t.string :priority
      t.string :assigned_to
      t.date :target_resolution_date
      t.string :resolution_date

      t.timestamps
    end
  end
end
