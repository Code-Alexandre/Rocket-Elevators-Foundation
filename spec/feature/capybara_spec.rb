describe "the login process", type: :feature do

  
  it "signs me in" do
    visit '/users/sign_in'
    within("#new_user") do
      fill_in 'user_email', with: 'nicolas.genest@codeboxx.biz'
      fill_in 'user_password', with: '123456'
    end
    click_button 'Log in'
    expect(page).to have_current_path '/users/sign_in'
    p page
  end
end