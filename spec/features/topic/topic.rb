require 'rails_helper'

feature 'Topic' do
  scenario 'A user must be logged in to create a topic' do
    visit_forum

    click_on 'Start Topic'

    expect(find('#topicError')).to have_content('You must be logged on in order to post on this board.')
  end
  scenario 'A user can create a topic' do
    sign_in

    visit_forum
    click_on 'Start Topic'

    expect(page).to have_content('User is Signed in')
  end
end

def visit_forum
  @forum = FactoryGirl.create(:forum)
  visit forum_show_path(@forum)
  expect(find('.PgBoardName')).to have_content('Example Forum')
end

def sign_in
  @user = FactoryGirl.create(:user)

  visit new_user_session_path
  fill_in 'user[user_name]', :with => @user.user_name
  fill_in 'user[password]', :with => @user.password
  click_on 'Log in'

  expect(find('#session')).to have_content('Sign out')
end
