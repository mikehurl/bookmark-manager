require 'spec_helper'

feature 'Adding links', :type => :feature do

  scenario 'I can add links to my list' do
    visit '/links'
    click_button('Add Link')
    fill_in('title', :with => 'Dog gif page')
    fill_in('url', :with => "http://www.doggifpage.com/")
    click_button('Create Link')
    expect(page).to have_content('Dog gif page')
  end
end
