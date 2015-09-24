require 'spec_helper'
require 'database_cleaner'

DatabaseCleaner.strategy = :truncation

# then, whenever you need to clean the DB
DatabaseCleaner.clean

describe VideosController do
  describe 'GET #index' do
    let(:videos) {Video.new}
    
    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end
end