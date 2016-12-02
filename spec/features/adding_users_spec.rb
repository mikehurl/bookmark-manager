require 'spec_helper.rb'

feature 'adding user accounts' do

  scenario 'see signup form' do
    visit('/')
    expect(page).to have_content("Sign up to save your links!")
    find_field("email")
    find_field("password")
    find_button("Register")
  end

end

feature 'signing up in full' do

  before(:each) do
    visit('/')
    fill_in("email", with: "example@mail.com")
    fill_in("password", with: "password123")
  end

  scenario 'be able to submit user name and password' do
    click_button("Register")
    expect(page.status_code).to eq 200
  end

  scenario 'be redirected to the "links" page when you have signed up' do
    fill_in("password_confirmation", with: "password123")
    click_button("Register")
    expect(page).to have_current_path('/links')
  end

  scenario 'the user is welcomed and their email address is displayed in the message after signing up' do
    fill_in("password_confirmation", with: "password123")
    click_button("Register")
    expect(page).to have_content("Welcome example@mail.com!")
  end

  scenario 'the user count increases' do
    fill_in("password_confirmation", with: "password123")
    expect{click_button("Register")}.to change(User, :count).by(1)
  end

  scenario 'a new user is not saved to the database if they do not confirm their password correctly' do
    fill_in("password_confirmation", with: "password124")
    expect{click_button("Register")}.not_to change(User, :count)
  end

end
