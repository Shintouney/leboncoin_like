require 'rails_helper'

feature "Offer creation", :devise do
  scenario "user cannot create an offer without filling all the form", js: true do
    visit(new_account_offer_path)
    click_on "sign_in_link"
    expect(current_path).to eq "/users/sign_in"
    user     = FactoryBot.create(:user)
    category = FactoryBot.create(:category)
    only_sign_in(user.email, user.password)
    click_on "submit_form"
    expect(page.body).to have_content("Le titre doit être rempli(e)")
    expect(page.body).to have_content("Le prix doit être rempli(e)")
    expect(page.body).to have_content("Le prix n'est pas un nombre")
    expect(page.body).to have_content("La description doit être rempli(e)")
    expect(page.body).to have_content("La ville doit être rempli(e)")
    expect(page.body).to have_content("La photo doit être rempli(e)")
  end

  scenario "user can create an offer", js: true do
    visit(new_account_offer_path)
    click_on "sign_in_link"
    expect(current_path).to eq "/users/sign_in"
    user     = FactoryBot.create(:user)
    category = FactoryBot.create(:category)
    only_sign_in(user.email, user.password)
    page.execute_script("document.getElementById('category_id').value = 'Voiture'")
    fill_in "offer_title", with: "Mon produit"
    fill_in "offer_price", with: "42"
    fill_in "offer_description", with: "Basic description"
    fill_in "offer_location", with: "42100"
    attach_file('offer_cover_picture', "spec/files/default.jpg")
    click_on "submit_form"
    sleep(2)
    expect(Offer.all.size).to eq 1
    expect(current_path).to eq "/account/offer/1"
    expect(page.body).to have_content "Mon produit"
    expect(page.body).to have_content "Basic description"
    expect(page.body).to have_content "42100"
  end

end
