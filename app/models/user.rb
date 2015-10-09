class User < ActiveRecord::Base
  has_many :queue_items, -> { order(:position) }
  
  has_secure_password
  
  validates_presence_of :email, :password, :username
  validates_uniqueness_of :email
  
  def normalize_queue_item_positions
    queue_items.each_with_index do |queue_item, index|
      queue_item.update_attributes(position: index+1)
    end
  end
  
  def queued_videos?(video)
    queue_items.map(&:video).include?(video)
  end
end