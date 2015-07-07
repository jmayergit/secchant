require 'rails_helper'

feature 'User signs in' do
  scenario 'with valid credentials' do
    @user = FactoryGirl.create(:user)

    user_signs_in_with(@user.email, @user.password)

    expect(page).to have_content 'Sign out'
  end

  scenario 'with invalid credentials' do
    user_signs_in_with('nonregistered@email.com', 'password')

    expect(page).to have_content 'Sign in'
  end
end

feature 'User signs out' do
  scenario 'with sign out link' do
    @user = FactoryGirl.create(:user)

    user_signs_in_with(@user.email, @user.password)
    expect(page).to have_content 'Sign out'

    click_on 'Sign out'
    expect(page).to have_content 'Sign in'
  end
end


def user_signs_in_with(email, password)
  visit new_user_session_path

  fill_in 'user[email]', :with => email
  fill_in 'user[password]', :with => password
  click_on 'Log in'
end
