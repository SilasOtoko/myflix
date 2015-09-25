require 'spec_helper'
require 'database_cleaner'

DatabaseCleaner.strategy = :truncation

# then, whenever you need to clean the DB
DatabaseCleaner.clean

describe SessionsController do
  describe "GET new" do
    it "renders the new template for unauthenticated users" do
      get :new
      expect(response).to render_template :new
    end
    it "redirects to the home page for authenticated users" do
      session[:user_id] = Fabricate(:user).id
      get :new
      expect(response).to redirect_to home_path
    end
  end
  
  describe "GET destroy" do
    before do
      session[:user_id] = Fabricate(:user).id
      get :destroy
    end
    it "clears the session for the user" do
      expect(session[:user_id]).to be_nil
    end
    
    it "redirects to the root path" do
      expect(response).to redirect_to root_path
    end
    
    it "sets the notice" do
      expect(flash[:notice]).not_to be_blank
    end
  end
end