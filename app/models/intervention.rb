class Intervention < ApplicationRecord
    after_create :ticket_create_contact
    require 'zendesk_api'
    validates :author_id, presence: true
    validates :customer_id, presence: true
    validates :building_id, presence: true
    validate :intervention_valid

    belongs_to :author, class_name: "Employee"
    belongs_to :employee, class_name: "Employee", optional: true
    belongs_to :customer, class_name: "Customer"
    belongs_to :building, class_name: "Building"
    belongs_to :battery, class_name: "Battery", optional: true
    belongs_to :column, class_name: "Column", optional: true
    belongs_to :elevator, class_name: "Elevator", optional: true


    def ticket_create_contact
        client = ZendeskAPI::Client.new do |config|
            # Mandatory:
          
            config.url = "https://code-alexandre.zendesk.com/api/v2" # e.g. https://rocketelevator8148.zendesk.com/api/v2
          
            # Basic / Token Authentication
            config.username = "alex.lapres@outlook.com"
            
          
            # Choose one of the following depending on your authentication choice
            config.token = ENV["ZENDESK_APIKEY"]
          
          #   # OAuth Authentication
          #   config.access_token = "your OAuth access token"
          
            # Optional:
          
            # Retry uses middleware to notify the user
            # when hitting the rate limit, sleep automatically,
            # then retry the request.
            config.retry = true
          
            # Raise error when hitting the rate limit.
            # This is ignored and always set to false when `retry` is enabled.
            # Disabled by default.
            config.raise_error_when_rate_limited = false
          
            # Logger prints to STDERR by default, to e.g. print to stdout:
            require 'logger'
            config.logger = Logger.new(STDOUT)
          
            # Disable resource cache (this is enabled by default)
            config.use_resource_cache = false
          
            # Changes Faraday adapter
            # config.adapter = :patron
          
            # Merged with the default client options hash
            # config.client_options = {:ssl => {:verify => false}, :request => {:timeout => 30}}
          
            # When getting the error 'hostname does not match the server certificate'
            # use the API at https://yoursubdomain.zendesk.com/api/v2
        end
        customer = Customer.find(customer_id)
        author = Employee.find(author_id)
        employee = Employee.find(employee_id)
        # ticket = ZendeskAPI::Ticket.new("#{client}", :id => 1, :priority => "urgent")
        puts "This is the client after creation #{client}"
        client.tickets.create(
            :subject => "#{author_id} from #{customer_id}", 
            :comment => { :value => "The author #{author.first_name} #{author.last_name} from company #{customer.compagny_name} BuildingID# #{building_id} , ColumnID# #{column_id} , ElevatorID# #{elevator_id} The employee to be assigned to the task #{employee.first_name} #{employee.last_name}which would require contribution from Rocket Elevators #{report}" }, 
            :submitter_id => client.current_user.id,
            :type => "question", 
            :priority => "normal")
        puts "Ticket creation?"
        client.tickets.save
        puts "Ticket saved?"
    end

    def intervention_valid
        if !self.customer_id && !self.building_id
            errors.add(:you, 'must select those two following option: Customer, Building')
        end  
    end    
end
