require 'spec_helper'

feature 'Viewing links', :type => :feature do

  scenario 'I can see existing links on the link page' do
    Link.create(url: 'http://www.catgifpage.com', title: 'Cat gif page')

    visit '/links'

    expect(page.status_code).to eq 200

    within 'ul#links' do
      expect(page).to have_content('Cat gif page')
    end
  end
end
