# frozen_string_literal: true

RSpec.feature 'Sign In', type: :feature do
  background do
    @user = create(:user, email: 'email@person.com', password: 'secret', password_confirmation: 'secret')
    visit spree.login_path
  end

  scenario 'let a user sign in successfully' do
    fill_in 'Email', with: @user.email
    fill_in 'Password:', with: @user.password
    click_button 'Login'

    expect(page).to have_text 'Logged in successfully'
    expect(page).not_to have_text 'Login'
    expect(page).to have_text 'Logout'
    expect(current_path).to eq '/'
  end

  scenario 'show validation erros' do
    fill_in 'Email', with: @user.email
    fill_in 'Password:', with: 'wrong_password'
    click_button 'Login'

    expect(page).to have_text 'Invalid email or password'
    expect(page).to have_text 'Login'
  end

  it "should store the user previous location" do
    visit spree.account_path
    fill_in "Email", with: @user.email
    fill_in "Password", with: @user.password
    click_button "Login"
    expect(current_path).to eq "/account"
  end
end
