require 'capybara/rspec'

describe "Contact Us Form", type: :feature do
    it "Fill in Contact Us form" do
        visit '/index#contact'
        within("#new_lead") do
        fill_in 'lead_full_name', with: 'Alexandre'
        fill_in 'lead_email', with: 'alex.lapres@outlook.com'
        fill_in 'lead_phone_number', with: '5149725331'
        fill_in 'lead_company_name', with: 'Code-Alexandre'
        fill_in 'lead_project_name', with: 'Coding'
        select 'Residential', from: 'lead[departement]'
        fill_in 'lead_project_description', with: 'Hello world'
        fill_in 'lead_message', with: 'I like elevatorrr'
    end
    click_button 'SEND MESSAGE'
    expect(page).to have_current_path '/index'
    p page 
    end

end