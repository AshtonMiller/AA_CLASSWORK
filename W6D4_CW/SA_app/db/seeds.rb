# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ActiveRecord::Base.transaction do
  ArtworkShare.destroy_all
  Artwork.destroy_all
  User.destroy_all
 
  sarah = User.create!(username: 'Sarah')
  ashton = User.create!(username: 'Ashton')
  lex = User.create!(username: 'Lex')
  macallen = User.create!(username: 'Macallen')

  cute_kitty = Artwork.create!(title: "cute_kitty", image_url: "www.cute_kitty.com", artist_id: sarah.id)
  cute_puppy = Artwork.create!(title: "cute_puppy", image_url: "www.cute_puppy.com", artist_id: ashton.id)
  nature_walk = Artwork.create!(title: "nature_walk", image_url: "www.nature_walk.com", artist_id: lex.id)
  city_pic = Artwork.create!(title: "city_pic", image_url: "www.city_pic.com", artist_id: macallen.id)
  mountain_walk = Artwork.create!(title: "mountain_walk", image_url: "www.mountain_walk.com", artist_id: sarah.id)
  fishing_trip = Artwork.create!(title: "fishing_trip", image_url: "www.fishing_trip.com", artist_id: ashton.id)

  v1 = ArtworkShare.create!(artwork_id: cute_kitty.id, viewer_id: sarah.id)
  v2 = ArtworkShare.create!(artwork_id: cute_puppy.id, viewer_id: sarah.id)
  v3 = ArtworkShare.create!(artwork_id: nature_walk.id, viewer_id: sarah.id)
  v4 = ArtworkShare.create!(artwork_id: nature_walk.id, viewer_id: ashton.id)
  v5 = ArtworkShare.create!(artwork_id: fishing_trip.id, viewer_id: ashton.id)
  v6 = ArtworkShare.create!(artwork_id: mountain_walk.id, viewer_id: ashton.id)
  v7 = ArtworkShare.create!(artwork_id: cute_kitty.id, viewer_id: ashton.id)
  v8 = ArtworkShare.create!(artwork_id: cute_kitty.id, viewer_id: macallen.id)
  v9 = ArtworkShare.create!(artwork_id: mountain_walk.id, viewer_id: macallen.id)
  v10 = ArtworkShare.create!(artwork_id: cute_kitty.id, viewer_id: lex.id)
  v11 = ArtworkShare.create!(artwork_id: cute_puppy.id, viewer_id: lex.id)
  
end
