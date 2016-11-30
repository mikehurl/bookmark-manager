require 'spec_helper'

feature 'Filtering links', :type => :feature do

  scenario 'I can filter links by their tag' do
    visit '/links/new'
    fill_in('title', :with => 'Bubble gif page')
    fill_in('url', :with => "http://www.google.com")
    fill_in('tag_name', :with => "bubbles")
    click_button('Create Link')
    fill_in('tags', :with => "bubbles")
    click_button('Filter Tags')
    expect(page).to have_content('http://www.google.com')
  end
end
