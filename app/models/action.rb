class Action < ApplicationRecord
    has_many :strategies
    has_many :users, through: :strategies
end
