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
    fill_in "offer_description", with: "Basic descriptiol"
    fill_in "offer_location", with: "42100"
    click_on "submit_form"
  end

end
