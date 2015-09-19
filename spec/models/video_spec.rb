require 'spec_helper'

describe Video do
  it "saves itself" do
    video = Video.new(title: "Pokemon", description: "cute pocket monsters", small_cover: "http://ocala.cgashows.com/wp-content/uploads/2015/03/Pokemon.jpg",
      large_cover: "http://ocala.cgashows.com/wp-content/uploads/2015/03/Pokemon.jpg")
    video.save
    Video.find(2).title.should == "Pokemon"
  end
end