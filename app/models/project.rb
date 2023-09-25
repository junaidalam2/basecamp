class Project < ApplicationRecord
    has_many :issue
    belongs_to :user
end
