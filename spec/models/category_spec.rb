require 'spec_helper'
require 'database_cleaner'

DatabaseCleaner.strategy = :truncation

# then, whenever you need to clean the DB
DatabaseCleaner.clean

describe Category do
  it { should have_many(:videos)}
  
  describe "#recent_videos" do
    it "returns the videos in the reverse chronological order by created at" do
      comedies = Category.create(category_name: "comedies")
      futurama = Video.create(title: "Futurama", description: "Space Travel", category_id: comedies.id, created_at: 1.day.ago)
      back_to_future = Video.create(title: "Back to Future", description: "Time Travel", category_id: comedies.id)
      expect(comedies.recent_videos).to eq([back_to_future, futurama])
    end
    
    it "returns all the videos if there are less than 6 videos" do
      anime = Category.create(category_name: "Anime")
      fairy_tail = Video.create(title: "Fairy Tail", description: "Space Travel", category_id: anime.id, created_at: 1.day.ago)
      sword_art_online = Video.create(title: "Sword Art Online", description: "Time Travel", category_id: anime.id)
      expect(anime.recent_videos.count).to eq(2)
    end
    
    it "returns 6 videos if there are more than 6 videos" do
      action = Category.create(category_name: "Action")
      7.times { Video.create(title: "Bourne Identity", description: "Action", category_id: action.id) }
      expect(action.recent_videos.count).to eq(6)
    end
    it "returns the most recent 6 videos" do
      anime = Category.create(category_name: "Anime")
      6.times { Video.create(title: "Your lie in April", description: "Space Travel", category_id: anime.id) }
      usagi_drop = Video.create(title: "Usagi Drop", description: "Time Travel", category_id: anime.id, created_at: 1.day.ago)
      expect(anime.recent_videos).not_to include(usagi_drop)
    end
    it "returns an empty array if the category does not have any videos" do
      family = Category.create(category_name: "Family")
      
      expect(family.recent_videos).to eq([])
    end
  end
end