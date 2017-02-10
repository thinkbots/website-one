feature 'User visits homepage' do
  background do
    visit '/'
  end

  scenario 'and the page has the correct title' do
    title = 'Web and mobile apps development and design | Thinkbots'
    expect(page).to have_title title
  end

  scenario 'and sees call to action in heading section' do
    heading = 'We craft user focused digital experiences.'

    within :css, '#home-slider' do
      expect(page).to have_content heading
      expect(page).to have_link 'Get in touch', href: '#hireUs'
    end
  end

  scenario 'and sees the list of services' do
    within :css, '#services' do
      expect(page).to have_content 'Web Development'
      expect(page).to have_content 'Mobile Apps'
      expect(page).to have_content 'Digital Design'
      expect(page).to have_content 'Training'
    end
  end

  scenario 'and sees description and contact information in the footer' do
    within :css, '.footer-1-1' do
      expect(page).to have_content 'About Us'
      expect(page).to have_content 'Contact Us'
      expect(page).to have_link nil, href: '#hireUs'
    end
  end

  scenario 'and sees social media links' do
    social_links = [
      '//github.com/thinkbots',
      '//facebook.com/thinkbotsIO',
      '//twitter.com/ThinkbotsIO',
      '//www.linkedin.com/company/thinkbots'
    ]

    within :css, '.footer-1-1' do
      within :css, '.social-icons' do
        social_links.each do |link|
          expect(page).to have_link nil, href: link
        end
      end
    end
  end
end
