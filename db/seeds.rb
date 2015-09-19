# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Video.create(title: "Sword Art Online", description: "Stuck in a virtual world",
  small_cover: "http://images6.fanpop.com/image/photos/34900000/sword-art-online-sword-art-online-fans-34959044-1280-1024.jpg",
  large_cover: "http://images6.fanpop.com/image/photos/34900000/sword-art-online-sword-art-online-fans-34959044-1280-1024.jpg")

Category.create(category_name: "Anime")
