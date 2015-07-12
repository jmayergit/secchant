require 'rails_helper'

feature 'User signs up' do
  scenario 'With invalid email(blank)' do
    user_signs_up_with('', 'aUsername', 'aPassword', 'aPassword')

    expect(find('#error_explanation')).to have_content('Email can\'t be blank')
  end

  scenario 'With invalid email(regex)' do
    user_signs_up_with('anEmail', 'aUsername', 'aPassword', 'aPassword')

    expect(find('#error_explanation')).to have_content('Email is invalid')
  end

  scenario 'With invalid email(non-unique)' do
    @user = FactoryGirl.create(:user)

    user_signs_up_with(@user.email, 'anotherUsername', 'aPassword', 'aPassword')

    expect(find('#error_explanation')).to have_content('Email has already been taken')
  end

  scenario 'With invalid username(blank)' do
    user_signs_up_with('anEmail@domain.com', '', 'aPassword', 'aPassword')

    expect(find('#error_explanation')).to have_content('User name can\'t be blank')
  end

  scenario 'With invalid username(non-unique)' do
    @user = FactoryGirl.create(:user)

    user_signs_up_with('anEmail@domain.com', @user.user_name, 'aPassword', 'aPassword')

    expect(find('#error_explanation')).to have_content('User name has already been taken')
  end

  scenario 'with invalid(short) password' do
    user_signs_up_with('anEmail@domain.com', 'aUsername', 'aPass', 'aPass')

    expect(find('#error_explanation')).to have_content('Password is too short')
  end

  scenario 'with invalid confirmation' do
    user_signs_up_with('anEmail@domain.com', 'aUsername', 'aPassword', 'anotherPassword')

    expect(find('#error_explanation')).to have_content('Password confirmation doesn\'t match Password')
  end

  scenario 'with valid credentials' do
    user_signs_up_with('anEmail@domain.com', 'aUsername', 'aPassword', 'aPassword')

    expect(find('.session')).to have_content('Sign out')
  end
end

# admin cannot sign up via web pages, must be created through command line

def user_signs_up_with(email, user_name, password, confirmation)
  visit new_user_registration_path

  fill_in 'user[email]', :with => email
  fill_in 'user[user_name]', :with => user_name
  fill_in 'user[password]', :with => password
  fill_in 'user[password_confirmation]', :with => confirmation
  find('.actions').click_on 'Sign up'
end
