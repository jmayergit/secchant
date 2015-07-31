require 'rails_helper'

feature 'A user creates a topic' do
  scenario 'While not signed in' do
    start_topic

    expect(find('#errorColumn')).to have_content('You must be logged on in order to post on this board.')
  end

  scenario 'With a blank subject' do
    sign_in
    start_topic

    click_on 'Create Topic'

    expect(find('#errorColumn')).to have_content('Subject cannot be blank.')
  end

  scenario 'While signed in with a non-blank subject' do
    sign_in
    start_topic

    fill_in 'topic[subject]', :with => 'A non-blank subject'
    click_on 'Create Topic'

    expect(find('#subject')).to have_content('A non-blank subject')
  end
end

feature 'A user edites a topic' do
  scenario 'With a blank subject' do
  end
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
