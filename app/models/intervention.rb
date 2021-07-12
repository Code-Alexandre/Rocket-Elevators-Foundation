class Intervention < ApplicationRecord
    # validates :author_id, presence: true
    # validates :customer_id, presence: true
    # validates :building_id, presence: true
    # validate :intervention_valid

    belongs_to :author, class_name: "Employee"
    belongs_to :author, class_name: "Employee", optional: true
    belongs_to :author, class_name: "Customer"
    belongs_to :author, class_name: "Building"
    belongs_to :author, class_name: "Battery", optional: true
    belongs_to :author, class_name: "Column", optional: true
    belongs_to :author, class_name: "Elevator", optional: true


    # def intervention_valid
    #     if !self.battery_id && !self.column_id && !self.elevator_id
    #         errors.add(:you, 'must select at least one of the following option: Battery, Column, Elevator')
    #     end
        
    # end    
end
