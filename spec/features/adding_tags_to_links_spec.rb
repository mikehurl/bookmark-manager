require 'spec_helper.rb'

feature 'Adding tags to links' do

  scenario 'adding tags to links' do
    visit '/links/new'
    fill_in("Link", with: "http://www.makersacademy.com")
    fill_in("Title", with: "Makers Academy")
    fill_in("Tag", with: 'coding')
    click_button("Submit")


    link = Link.first
    expect(link.tags.map(&:name)).to include('coding')
  end

end
