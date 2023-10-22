class Project < ApplicationRecord
    has_many :issues, dependent: :destroy
    has_and_belongs_to_many :users
    validates :name, :description, :time_frame_for_completion, :user_id, presence: true
end
