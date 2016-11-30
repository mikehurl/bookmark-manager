require 'spec_helper'
require 'database_cleaner'

feature 'Submitting new link', :type => :feature do

  scenario 'We want to submit link into list' do
    visit '/links/new'
    fill_in("Link", with: "http://www.makersacademy.com")
    fill_in("Title", with: "Makers Academy")
    click_button("Submit")
  end

  scenario "test that the URL and title are added to the list" do
    visit '/links/new'
    fill_in("Link", with: "http://www.makersacademy.com")
    fill_in("Title", with: "Makers Academy")
    click_button("Submit")
    expect(page).to have_content ("Title: Makers Academy URL: http://www.makersacademy.com")
  end
end
