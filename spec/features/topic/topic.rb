require 'rails_helper'

feature 'Topic' do
  scenario 'A topic is created with a User and Forum' do
    @topic = FactoryGirl.create(:topic)
  end
end
