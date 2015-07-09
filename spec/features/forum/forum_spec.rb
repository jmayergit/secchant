require 'rails_helper'

feature 'Forum can be accessed' do
  scenario 'From home page' do
    visit root_path

    find('#ContentL').click_on 'SEC Rant'

    expect(find('.PgBoardName')).to have_content('SEC Rant')
  end

  scenario 'From another forums page' do
    visit forum_show_path(1)
    expect(find('.PgBoardName')).to have_content 'SEC Rant'

    find('#LNav').click_on 'Help Board'

    expect(current_path).to eq(forum_show_path(2))
  end
end
