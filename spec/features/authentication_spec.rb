require 'rails_helper'

feature 'Fixture data' do
  scenario 'Is available' do
    assert_equal 2, User.count
  end
end

feature 'Signing in' do
  scenario 'Signing in with correct credentials' do
    visit '/users/sign_in'
    expect(page).to have_content 'Sign in'

    fill_in 'user[email]', :with => 'user@example.com'
    fill_in 'user[password]', :with => 'password'
    click_on 'Log in'

    expect(page).to have_content 'Sign out'
  end
end
