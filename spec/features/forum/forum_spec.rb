require 'rails_helper'

feature 'Forum can be accessed' do
  scenario 'From home page' do
    visit root_path

    click_on 'SEC Rant'

    expect(page).to have_content('SEC Rant')
  end
end
