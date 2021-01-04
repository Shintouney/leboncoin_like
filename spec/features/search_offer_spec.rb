require 'rails_helper'

feature "Offer search", :devise do
  scenario "user can search an offer", js: true do
    visit(root_path)
    expect(current_path).to eq "/"
  end

end
