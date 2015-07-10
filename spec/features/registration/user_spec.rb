require 'rails_helper'

feature 'User signs up' do
  scenario 'With valid email and password' do
    sign_up_with('valid@email.com', 'password', 'password')

    expect(find('#session')).to have_content 'Sign out'
  end

  scenario 'With invalid email' do
    sign_up_with('invalid@email', 'password', 'password')

    expect(find('#error_explanation')).to have_content 'Email is invalid'
  end

  # scenario 'With pre-existing email'
  # could use factory girl but I do not know what the sequenced
  # email would be other option is to manually sign up but that is
  # ugly

  scenario 'With blank password' do
    sign_up_with('valid@email.com', '', '')

    expect(find('#error_explanation')).to have_content 'Password can\'t be blank'
  end

  scenario 'With password confirmation not matching password' do
    sign_up_with('valid@email.com', 'password', 'anotherPassword')

    expect(find('#error_explanation')).to have_content 'Password confirmation doesn\'t match Password'
  end
end

# admin cannot sign up via web pages, must be created through command line

def sign_up_with(email, user_name, password, confirmation)
  visit new_user_registration_path

  fill_in 'user[email]', :with => email
  fill_in 'user[user_name]', :with => user_name
  fill_in 'user[password]', :with => password
  fill_in 'user[password_confirmation]', :with => confirmation
  find('.actions').click_on 'Sign up'
end
