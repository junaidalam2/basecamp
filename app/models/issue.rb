class Issue < ApplicationRecord
    belongs_to :project
    belongs_to :user
    has_many :comment, dependent: :destroy
    validates :project_id, :short_description, :detailed_description, :steps_to_reproduce, :priority, presence: true
    accepts_nested_attributes_for :comment, reject_if: proc { |att| att['comment'].blank? } #, allow_destroy: true
end
