class Issue < ApplicationRecord
    belongs_to :project
    belongs_to :user
    has_many :comments, dependent: :destroy, inverse_of: :issue
    validates :project_id, :short_description, :detailed_description, :contact_user_id, :priority, presence: true
    accepts_nested_attributes_for :comments, reject_if: proc { |att| att['comments'].blank? }, allow_destroy: true
end
