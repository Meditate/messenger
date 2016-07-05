require 'rails_helper'

feature 'Sign In' do

  let(:user){create(:user)}

  scenario 'User cant sign in if creadentials not correct' do

    signin('invalidemail@exa,ple.com','imvalidpassword')

    expect(page).to have_content('Invalid Email')

  end

  scenario 'User cant sign in if email not correct' do

    signin('invalidemail@example.com',user.email)

    expect(page).to have_content('Invalid Email')

  end

  scenario 'User cant sign in if password not correct' do

    signin(user.email,'invalidpassword')

    expect(page).to have_content('Invalid Email')

  end

  scenario 'User can sign in if credentials correct' do

    signin(user.email,user.password)

    expect(page).not_to have_content('Invalid Email')

  end

end