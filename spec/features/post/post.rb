require 'rails_helper'

feature 'Posts' do
  scenario 'A post is created with a User and Forum' do
    @post = FactoryGirl.create(:post)
  end
end
