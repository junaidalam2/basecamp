class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :lead_first_name
      t.string :lead_last_name
      t.string :description
      t.date :time_frame_for_completion
      t.timestamp :creation_date

      t.timestamps
    end
  end
end
