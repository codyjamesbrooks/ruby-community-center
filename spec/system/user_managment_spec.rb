require 'rails_helper'

RSpec.describe "User Managment", type: :system do
  let(:user) { create(:user) }

  scenario "a user signs up" do
    visit new_user_registration_path

    fill :email, with: "email@example.com"
    fill :password, with: "password"
    fill :password_confirmation, with: "password"
    submit_form

    expect(page).to have_success_flash
    expect(page).to have_link t("application.user_navigation.user_account")
  end

  scenario "a user signs in" do
    visit new_user_session_path

    fill :email, with: user.email
    fill :password, with: user.password
    submit_form

    expect(page).to have_success_flash
    expect(page).to have_link t("application.user_navigation.user_account")
  end

  scenario "a user signs out" do
    login_as user
    visit root_path

    click_on t("application.user_navigation.sign_out")

    expect(page).to have_success_flash
    expect(page).to have_link t("application.user_navigation.login")
    expect(page).to have_link t("application.user_navigation.sign_up")
  end

  def form_name
    "user"
  end
end
