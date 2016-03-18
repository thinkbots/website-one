feature 'User visits homepage' do
  background do
    visit '/'
  end

  scenario 'and the page has the correct title' do
    expect(page).to have_title 'Thinkbots'
  end
end
