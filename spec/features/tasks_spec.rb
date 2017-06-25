require 'rails_helper'

feature '対象となる機能' do

  scenario 'トップページからNew Taskに遷移する' do
    visit tasks_path
    click_link 'New Task'

    expect(page).to have_css('h1', text: 'New Task')
  end

end
