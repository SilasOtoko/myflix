require 'spec_helper'
require 'database_cleaner'

DatabaseCleaner.strategy = :truncation

# then, whenever you need to clean the DB
DatabaseCleaner.clean

describe Video do
  it { should belong_to(:category)}
  it { should validate_presence_of(:title)}
  it { should validate_presence_of(:description)}
  it { should have_many(:reviews).order("created_at DESC") }
  
  describe "search_by_title" do
    let!(:futurama) { Fabricate(:video, title: "Futurama", category_id: 2) }
    let!(:back_to_future) { Fabricate(:video, title: "Back to Future", category_id: 2) }
    
    it "no match" do
      expect(Video.search_by_title("hello")).to eq([])
    end
    it "one match" do
      expect(Video.search_by_title("Futurama")).to eq([futurama])
    end
    it "partial match" do
      expect(Video.search_by_title("urama")).to eq([futurama])
    end
    it "returns all matches" do
      expect(Video.search_by_title("Futur")).to eq([back_to_future, futurama])
    end
  end
end