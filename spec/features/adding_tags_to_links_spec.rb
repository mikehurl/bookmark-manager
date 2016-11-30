feature 'tagging links' do

  scenario 'adding tags to links' do
    visit '/links/new'
    fill_in("Link", with: "http://www.makersacademy.com")
    fill_in("Title", with: "Makers Academy")
    fill_in("Tag", with: 'Coding')
    click_button("Submit")

    expect(page).to have_content("Coding")
  end

end
