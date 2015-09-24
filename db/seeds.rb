# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Video.create(title: "Sword Art Online", description: "Stuck in a virtual world",
  small_cover: "http://images6.fanpop.com/image/photos/34900000/sword-art-online-sword-art-online-fans-34959044-1280-1024.jpg",
  large_cover: "http://images6.fanpop.com/image/photos/34900000/sword-art-online-sword-art-online-fans-34959044-1280-1024.jpg",
  category_id: 1)

Video.create(title: "Pirates", description: "A korean film about priates",
  small_cover: "https://jediprincess.files.wordpress.com/2015/01/pirates.jpg",
  large_cover: "https://jediprincess.files.wordpress.com/2015/01/pirates.jpg",
  category_id: 2)
  
Video.create(title: "Family Guy", description: "Funny, but sometimes a bit over the top humor",
  small_cover: "http://www.iwatchseries.me/wp-content/uploads/2014/10/Family-Guy.jpg",
  large_cover: "http://www.iwatchseries.me/wp-content/uploads/2014/10/Family-Guy.jpg",
  category_id: 3)
  
Video.create(title: "Fairy Tail", description: "Anime fun",
  small_cover: "http://cdn.myanimelist.net/images/anime/5/18179.jpg",
  large_cover: "http://cdn.myanimelist.net/images/anime/5/18179.jpg",
  category_id: 1)
  
Video.create(title: "Digimon", description: "Digital Monsters",
  small_cover: "https://upload.wikimedia.org/wikipedia/en/4/43/Digimon_Digital_Monsters_Season_1_DVD_Cover.png",
  large_cover: "https://upload.wikimedia.org/wikipedia/en/4/43/Digimon_Digital_Monsters_Season_1_DVD_Cover.png",
  category_id: 1)
  
Video.create(title: "Pokemon", description: "Pocket Monsters",
  small_cover: "http://zommods.com/wp-content/uploads/2015/04/PokeLARGE.jpg",
  large_cover: "http://zommods.com/wp-content/uploads/2015/04/PokeLARGE.jpg",
  category_id: 1)
  
Video.create(title: "Your lie in April", description: "Hits you right in the feels",
  small_cover: "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcQMQ5Vyu-mesXH_sAQhejCJNGJAGdtqrnlE-2hQizPM-FftNvi0",
  large_cover: "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcQMQ5Vyu-mesXH_sAQhejCJNGJAGdtqrnlE-2hQizPM-FftNvi0",
  category_id: 1)
  
Video.create(title: "Wolf's Rain", description: "Wolves",
  small_cover: "http://www.wolfs-rain.org/downloads/images/Group.jpg",
  large_cover: "http://www.wolfs-rain.org/downloads/images/Group.jpg",
  category_id: 1)
  
Video.create(title: "Totoro", description: "Wonderful story by Miyazaki",
  small_cover: "http://p1.pichost.me/i/34/1570420.jpg",
  large_cover: "http://p1.pichost.me/i/34/1570420.jpg",
  category_id: 1)

Category.create(category_name: "Anime")
Category.create(category_name: "Foreign Film")
Category.create(category_name: "Comedy")
