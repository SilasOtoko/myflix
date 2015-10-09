require 'spec_helper'

feature "user signs in" do
  scenario "with vaild email and password" do
    alice = Fabricate(:user)
    sign_in(alice)
    page.should have_content alice.username
  end
end