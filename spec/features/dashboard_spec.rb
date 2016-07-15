require 'rails_helper'

feature "Admin Dashboard" do

  let(:admin){create(:user,:admin)}
  let(:editor){create(:user,:editor)}
  let(:user){create(:user)}

  scenario 'admin can visit users_path' do

    signin(admin.email,admin.password)
    visit users_path

    expect(page).to have_content("Users list")

  end

  scenario 'editor can visit users_path' do

    signin(editor.email,editor.password)
    visit users_path

    expect(page).to have_content("Users list")
  end

  scenario 'user cant visit users_path' do

    signin(user.email,user.password)
    visit users_path

    expect(page).to have_content("You are not authorized")

  end

  scenario 'admin sees update-user button' do

    signin(admin.email,admin.password)
    visit users_path

    expect(page).to have_selector("input[value='Change Role']")
  end

  scenario 'admin sees delete-user button' do

    signin(admin.email,admin.password)
    visit users_path

    expect(page).to have_content("delete")
  end

  scenario 'editor does not see update-user button' do

    signin(editor.email,editor.password)
    visit users_path

    expect(page).not_to have_selector("input[value='Change Role']")
  end

  scenario 'editor does not see delete-user button' do

    signin(editor.email,editor.password)
    visit users_path

    expect(page).not_to have_content("delete")
  end



end