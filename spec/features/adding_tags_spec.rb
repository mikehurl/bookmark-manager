require 'spec_helper'

feature 'Tagging links', :type => :feature do

  scenario 'I can add tags to my links' do
    visit '/links'
    click_button('Add Link')
    fill_in('title', :with => 'Dog gif page')
    fill_in('url', :with => "http://www.doggifpage.com/")
    fill_in('tag_name', :with => "dog")
    click_button('Create Link')
    link = Link.first
    expect(link.tags.map(&:name)).to include('dog')
  end
end
