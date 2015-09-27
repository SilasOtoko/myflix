require 'spec_helper'
require 'database_cleaner'

DatabaseCleaner.strategy = :truncation

# then, whenever you need to clean the DB
DatabaseCleaner.clean

describe ReviewsController do
  describe "POST create" do
    let(:video) { Fabricate(:video) }
    let(:current_user) { Fabricate(:user) }
    
    context "with authenticated users" do
      before { session[:user_id] = current_user.id }
      context "with valid inputs" do
        before do
          post :create, review: Fabricate.attributes_for(:review), video_id: video.id, user: current_user
        end
        it "redirects to the video show page" do
          expect(response).to redirect_to video
        end
        it "creates a review" do 
          expect(Review.count).to eq(1)
        end
        it "creates a review associated with the video" do
          expect(Review.first.video).to eq(video)
        end
        it "creates a review associated with the signed in user" do
          expect(Review.first.user).to eq(current_user)
        end
      end
      context "with invalid inputs" do
        before do
          post :create, review: Fabricate.attributes_for(:review, content: nil), video_id: video.id, user: current_user
        end
        it "does not create a review" do
          expect(Review.count).to eq(0)
        end
        it "renders the videos/show template" do
          expect(response).to render_template "videos/show"
        end
        it "sets @video" do
          expect(assigns(:video)).to eq(video)
        end
        it "sets @reviews" do
          review = Fabricate(:review, video: video)
          post :create, review: Fabricate.attributes_for(:review, content: nil), video_id: video.id, user: current_user
          expect(assigns(:reviews)).to match_array([review])
        end
      end
    end
    context "with unauthenticated users" do
      it "redirects to the sign in path" do
        post :create, review: Fabricate.attributes_for(:review), video_id: video.id
        expect(response).to redirect_to sign_in_path
      end
    end
  end
end