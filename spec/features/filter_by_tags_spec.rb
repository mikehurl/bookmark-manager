require 'spec_helper.rb'

feature 'filtering by tags' do

  before(:each) do
    Link.create(url: 'www.makersacademy.com', title: 'Makers Academy', tags:[Tag.first_or_create(name: 'education')])
    Link.create(url: 'www.facebook.com', title: 'Facebook', tags:[Tag.first_or_create(name: 'bubbles')])
  end
  scenario 'filtering by added tags' do
    visit '/tags/bubbles'
    # require 'pry'; binding.pry
    # within 'ul#links' do
      expect(page).to have_content('Facebook')
      expect(page).not_to have_content('Makers Academy')
    # end
  end
end
