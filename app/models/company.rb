class Company < ApplicationRecord
    has_many :users
    has_many :jobs

    validate_presence_of :name, :description
end
