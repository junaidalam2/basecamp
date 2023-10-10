class Project < ApplicationRecord
    has_many :issue, dependent: :destroy
    has_and_belongs_to_many :user
end
