feature "User visits homepage" do 
  background do
    visit "/"
  end

  scenario "successfully" do
    expect(page).to have_css 'h1', text: 'welcome to thinkbots'
  end
end
