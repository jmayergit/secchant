require 'rails_helper'

feature 'User signs in' do
  scenario 'with invalid username' do
    @user = FactoryGirl.create(:user)

    user_signs_in_with('anothersUsername', @user.password)

    expect(find('#errorColumn')).to have_content('Invalid user_name or password')
  end

  scenario 'with invalid password' do
    @user = FactoryGirl.create(:user)

    user_signs_in_with(@user.user_name, 'anotherPassword')

    expect(find('#errorColumn')).to have_content('Invalid user_name or password')
  end

  scenario 'with valid username and password' do
    @user = FactoryGirl.create(:user)

    user_signs_in_with(@user.user_name, @user.password)

    expect(find('#session')).to have_content('Sign out')
  end
end


def user_signs_in_with(username, password)
  visit new_user_session_path

  fill_in 'user[user_name]', :with => username
  fill_in 'user[password]', :with => password
  click_on 'Log in'
end
