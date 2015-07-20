require 'rails_helper'

feature 'Admin signs in' do
  scenario 'with invalid credentials' do
    admin_signs_in_with('nonregistered@domain.com', 'password')

    expect(page).to have_content 'Sign in'
  end

  scenario 'with valid credentials' do
    @admin = FactoryGirl.create(:admin)

    admin_signs_in_with(@admin.email, @admin.password)

    expect(page).to have_content('Sign out')
  end

  scenario 'as god mode' do
    # @admin = FactoryGirl.create(:admin_god_mode)
    #                 or
    @admin = FactoryGirl.create(:admin, :god_mode)

    admin_signs_in_with(@admin.email, @admin.password)

    expect(page).to have_content('God Mode')
  end
end

def admin_signs_in_with(email, password)
  visit new_admin_session_path

  fill_in 'admin[email]', :with => email
  fill_in 'admin[password]', :with => password
  find('.actions').click_on 'Log in'
end
