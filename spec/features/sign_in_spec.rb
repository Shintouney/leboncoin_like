require 'rails_helper'

feature "Sign in", :devise do
  scenario "user cannot sign in if not registered" do
		sign_in("nohiken42@gmail.com", "riveton")
		expect(current_path).to eq "/users/sign_in"
  end
end
