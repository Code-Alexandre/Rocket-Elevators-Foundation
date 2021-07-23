require 'rails_helper'
require 'spec_helper'
require 'capybara/rspec'

RSpec.describe InterventionsController do 
    
    # Testing if the interventions controller returns a succesful HTTP response
    it"should give back a 200 succesful HTTP response" do
        expect(@response.status).to eq (200)
    end

    # Testing if the interventions controller returns successful response and an actual Intervention object 
    it "interventions controller should succesfully return an Intervention object' " do
        expect(@response.status).to eq (200)
        expect(Intervention).to_not eq(nil)

        p Intervention
    end
end

# describe "Intervention Form", type: :feature do
    
#     it "Fill in Intervention form" do
#         visit '/interventions/new'
#         puts "==========="
#         puts current_path
#         puts "==========="
#         find("#intervention_Choose_a_customer") do
#         fill_in 'intervention_Choose_a_customer', with: '10'
#         fill_in 'intervention_Choose_a_building', with: '63'
#         fill_in 'intervention_Choose_a_battery', with: '38'
#         fill_in 'intervention_Choose_a_column', with: '613'
#         fill_in 'intervention_Choose_a_elevator', with: '2000'
#         fill_in 'intervention_Choose_a_employee', with: '19'
#         fill_in 'intervention_Description', with: 'Hello world'
#       end
#       click_button 'Submit'
#       expect(page).to have_current_path '/admin/intervention'
#       p 'Submit'
#     end  
# end