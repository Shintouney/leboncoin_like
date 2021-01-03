require 'rails_helper'
require './spec/features/session_helper'

RSpec.configure do |c|
  c.include Helpers
end

RSpec.describe "an example group" do
  it "has access to the helper methods defined in the module" do
    sign_in("nohiken42@gmail.com", "riveton")
  end
end

feature "Sign in", :devise do
  scenario "user cannot sign in if not registered" do
  end
end
