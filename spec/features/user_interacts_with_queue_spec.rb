require 'spec_helper'
require 'database_cleaner'

DatabaseCleaner.strategy = :truncation

# then, whenever you need to clean the DB
DatabaseCleaner.clean

feature "User interacts with the queue" do
  scenario "user adds and reorders videos in the queue" do
    comedies = Fabricate(:category)
    monk = Fabricate(:video, title: "Monk", category_id: comedies.id)
    south_park = Fabricate(:video, title: "South Park", category_id: comedies.id)
    futurama = Fabricate(:video, title: "Futurama", category_id: comedies.id)
    
    sign_in

    add_video_to_queue(monk)
    expect_video_to_be_in_queue(monk)
    
    visit video_path(monk)
    expect_link_not_to_be_seen("+ My Queue")
    
    add_video_to_queue(south_park)
    add_video_to_queue(futurama)
    
    set_video_position(monk, 3)
    set_video_position(south_park, 1)
    set_video_position(futurama, 2)
    update_queue
    
    expect_video_position(south_park, 1)
    expect_video_position(futurama, 2)
    expect_video_position(monk, 3)
    
  end
  
  def expect_video_to_be_in_queue(video)
    expect(page).to have_content(video.title)
  end
  
  def expect_link_not_to_be_seen(link_text)
    expect(page).to have_no_content(link_text)
  end
  
  def update_queue
    click_button "Update Instant Queue"
  end
  
  def add_video_to_queue(video)
    visit home_path
    find("a[href='/videos/#{video.id}']").click
    click_link "+ My Queue"
  end
  
  def expect_video_position(video, position)
    expect(find("input[data-video-id='#{video.id}']").value).to eq(position.to_s)
  end
    
  def set_video_position(video, position)
    find("input[data-video-id='#{video.id}']").set(position)
  end
end