class Comment < ApplicationRecord
    belongs_to :issue, optional: true
    belongs_to :user
end
