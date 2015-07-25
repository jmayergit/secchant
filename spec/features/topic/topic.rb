require 'rails_helper'

feature 'A user creates a topic' do
  scenario 'While not signed in' do
    start_topic

    expect(find('#topicError')).to have_content('You must be logged on in order to post on this board.')
  end

  scenario 'With a blank subject'
end

def start_topic
  @forum = FactoryGirl.create(:forum)

  visit forum_show_path(@forum)
  expect(find('.PgBoardName')).to have_content('Example Forum')

  click_on 'Start Topic'
end

def sign_in
  @user = FactoryGirl.create(:user)

  visit new_user_session_path
  fill_in 'user[user_name]', :with => @user.user_name
  fill_in 'user[password]', :with => @user.password
  click_on 'Log in'

  expect(find('#session')).to have_content('Sign out')
end
