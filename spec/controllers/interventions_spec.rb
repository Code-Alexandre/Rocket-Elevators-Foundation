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