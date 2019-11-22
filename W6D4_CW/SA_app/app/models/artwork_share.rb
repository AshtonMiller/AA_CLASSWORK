# == Schema Information
#
# Table name: artwork_shares
#
#  id         :bigint           not null, primary key
#  artwork_id :integer          not null
#  viewer_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ArtworkShare < ApplicationRecord
  validates :artwork_id, uniqueness: { scope: :viewer_id, 
    message: "A user cannot have the same artwork shared with them more than once" }
  validates :artwork_id, :viewer_id, presence: true 

  belongs_to :art_piece,
    foreign_key: :artwork_id,
    class_name: 'Artwork'

  belongs_to :viewer,
    foreign_key: :viewer_id,
    class_name: 'User'




end
