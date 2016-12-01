require 'spec_helper.rb'

feature 'Adding multiple tags' do

  scenario "the user can add more than one tag to a link" do
    visit '/links/new'
    fill_in("Link", with: "http://www.makersacademy.com")
    fill_in("Title", with: "Makers Academy")
    fill_in("Tag", with: 'coding education')
    click_button("Submit")
    link = Link.first
    expect(link.tags.map(&:name)).to include('coding', 'education')
  end

end
