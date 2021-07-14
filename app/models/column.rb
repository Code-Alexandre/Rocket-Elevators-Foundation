class Column < ApplicationRecord
    has_many :elevators
    belongs_to :battery, class_name: "Battery", optional: true
    has_many :interventions
end
