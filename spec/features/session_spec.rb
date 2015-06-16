require 'rails_helper'


feature 'User signs in' do
  scenario 'with valid credentials' do
    @user = FactoryGirl.create(:user)
    expect(@user).to be_valid

    sign_in_with(@user.email, @user.password)

    expect(page).to have_content 'Sign out'
  end

  scenario 'with invalid credentials' do
    sign_in_with('nonregistered@email.com', 'password')

    expect(page).to have_content 'Sign in'
  end

  def sign_in_with(email, password)
    visit new_user_session_path

    fill_in 'user[email]', :with => email
    fill_in 'user[password]', :with => password
    click_on 'Log in'
  end
end
