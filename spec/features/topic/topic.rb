require 'rails_helper'

feature 'New Topic' do
  scenario 'A user must be logged in to see form' do
    visit_forum

    click_on 'Start Topic'

    expect(find('#topicError')).to have_content('You must be logged on in order to post on this board.')
  end

  scenario 'A user that is logged in can see form' do
    sign_in
    visit_forum

    click_on 'Start Topic'

    expect(find('#bodyR')).to have_content('Subject')
  end

  scenario 'A user can create a topic'
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
