require 'rails_helper'

feature "Sign in", :devise do
  scenario "user cannot sign in if not registered" do
    sign_in("nohiken42@gmail.com", "riveton")
    expect(current_path).to eq "/users/sign_in"
  end

  scenario 'user can sign in with valid credentials' do
    user = FactoryBot.create(:user)
    sign_in(user.email, user.password)
    expect(page).to have_content 'Connecté(e).'
    expect(current_path).to eq "/"
  end

  scenario 'when user sign in from offers/new it get redirected to the form creation' do
    visit(new_account_offer_path)
    click_on "sign_in_link"
    expect(current_path).to eq "/users/sign_in"
    user = FactoryBot.create(:user)
    only_sign_in(user.email, user.password)
    expect(current_path).to eq "/account/offer/new"
  end
end
