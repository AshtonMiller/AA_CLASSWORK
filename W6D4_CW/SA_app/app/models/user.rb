# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  username   :text
#

class User < ApplicationRecord
  validates :username, uniqueness: true, presence: true


  has_many :art_pieces, dependent: :destroy,
    foreign_key: :artist_id,
    class_name: 'Artwork'
    
   has_many :artwork_shares, dependent: :destroy,
    foreign_key: :viewer_id,
    class_name: 'ArtworkShare'

   has_many :shared_artworks, 
    through: :artwork_shares,
    source: :art_piece
end
