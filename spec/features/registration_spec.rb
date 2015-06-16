require 'rails_helper'

feature 'User signs up' do
  scenario 'With valid email and password' do
    sign_up_with('valid@email.com', 'password')

    expect(page).to have_content 'Sign out'
  end

  scenario 'With invalid email' do
    sign_up_with('invalid@email', 'password')

    expect(page).to have_content 'Email is invalid'
  end

  scenario 'With blank password' do
    sign_up_with('valid@email.com', '')

    expect(page).to have_content 'Password can\'t be blank'
  end

  def sign_up_with(email, password)
    visit new_user_registration_path

    fill_in 'user[email]', :with => email
    fill_in 'user[password]', :with => password
    fill_in 'user[password_confirmation]', :with => password
    click_on 'Sign up'
  end
end
