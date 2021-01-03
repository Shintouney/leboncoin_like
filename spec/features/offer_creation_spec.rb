require 'rails_helper'

feature "Offer creation", :devise do
  scenario "user create an offer", js: true do
		visit(new_account_offer_path)
		click_on "sign_in_link"
		expect(current_path).to eq "/users/sign_in"
		user     = FactoryBot.create(:user)
		category = FactoryBot.create(:category)
		only_sign_in(user.email, user.password)
    ap page.body
    click_on "Voiture"
    fill_in "offer_title", with: "Mon produit"
    fill_in "offer_price", with: "42"
    fill_in "offer_description", with: "Basic descriptiol"
    fill_in "offer_location", with: "42100"
    click_on "submit_form"
  end

end
