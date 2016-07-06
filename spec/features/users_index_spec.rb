require 'rails_helper'

feature 'Users Index' do

  let(:user){create(:user)}


  scenario 'User cant see Users index page if not logged' do

    visit users_path

    expect(page).to have_content("You need to sign in")

  end

  scenario 'User can see Users index page if logged in'do

    signin(user.email,user.password)

    visit users_path

    expect(page).to have_content('Users list')

  end

end