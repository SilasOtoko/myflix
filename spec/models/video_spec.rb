require 'spec_helper'
require 'database_cleaner'

DatabaseCleaner.strategy = :truncation

# then, whenever you need to clean the DB
DatabaseCleaner.clean

describe Video do
  it { should belong_to(:category)}
  it { should validate_presence_of(:title)}
  it { should validate_presence_of(:description)}
  
  describe "search_by_title" do
    let!(:futurama) { Fabricate.build(:video) }
    let!(:back_to_future) {  Video.create(title: "Back to Future", description: "Time Travel", category_id: 2) }
    
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