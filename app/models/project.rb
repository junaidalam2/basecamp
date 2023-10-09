class Project < ApplicationRecord
    has_many :issue
    has_and_belongs_to_many :user
end
