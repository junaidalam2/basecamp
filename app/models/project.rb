class Project < ApplicationRecord
    has_many :issues, dependent: :destroy, inverse_of: :project
    has_and_belongs_to_many :users
    validates :name, :description, :time_frame_for_completion, :user_id, presence: true
    accepts_nested_attributes_for :issues, allow_destroy: true, reject_if: :all_blank
end
