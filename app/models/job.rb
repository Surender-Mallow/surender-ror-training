class Job < ApplicationRecord
    belongs_to :company

    validates_presence_of :title, :description, :location, :salary
    validates_numericality_of :salary, greater_than: 0
end
