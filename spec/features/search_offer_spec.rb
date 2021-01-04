require 'rails_helper'

feature "Offer search", :devise do
  scenario "user can search and see all offer", js: true do
    visit(root_path)
    expect(current_path).to eq "/"

    FactoryBot.create(:user)
    FactoryBot.create(:category)
    offer = FactoryBot.create(:offer)
    offer_second = FactoryBot.create(:offer)
    click_on "submit_button"
    expect(current_path).to eq "/category_offer"
    expect(page.body).to have_content offer.title
    expect(page.body).to have_content offer.description
    expect(page.body).to have_content offer.price
    expect(page.body).to have_content offer_second.title
    expect(page.body).to have_content offer_second.description
    expect(page.body).to have_content offer_second.price
  end

  scenario "user can search through specific field", js: true do
    visit(root_path)
    expect(current_path).to eq "/"

    FactoryBot.create(:user)
    FactoryBot.create(:category)
    offer = FactoryBot.create(:offer)
    offer_second = FactoryBot.create(:offer)
    fill_in "location_search_origin", with: offer.location
    page.execute_script("document.getElementById('location_search').value = '#{offer.location}'")
    sleep(2)
    click_on "submit_button"
    expect(current_path).to eq "/category_offer"
    expect(page.body).to have_content offer.title
    expect(page.body).to have_content offer.description
    expect(page.body).to have_content offer.price
  end
end
