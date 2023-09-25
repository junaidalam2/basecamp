class User < ApplicationRecord
    has_many :project
    has_many :user
end
