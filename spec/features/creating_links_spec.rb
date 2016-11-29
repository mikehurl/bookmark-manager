require 'spec_helper'

feature 'Submitting new link', :type => :feature do
  scenario 'We want to submit link into list' do
    visit '/links/new'
    fill_in("Link", with: "https://www.woodlandtrust.org.uk/visiting-woods/trees-woods-and-wildlife/british-trees/")
    click_button("Submit")
  end
end
