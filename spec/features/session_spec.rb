require 'rails_helper'


feature 'User signs in' do
  scenario 'with valid credentials' do
    @user = FactoryGirl.create(:user)
    expect(@user).to be_valid

    visit '/users/sign_in'

    fill_in 'user[email]', :with => @user.email
    fill_in 'user[password]', :with => @user.password
    click_on 'Log in'

    expect(page).to have_content 'Sign out'
  end

  scenario 'with invalid credentials' do
    visit '/users/sign_in'

    fill_in 'user[email]', :with => 'invalid@email.com'
    fill_in 'user[password]', :with => 'invalid@password.com'
    click_on 'Log in'

    expect(page).to have_content 'Sign in'
  end
end
