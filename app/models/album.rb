class Album < ActiveRecord::Base
  validates :name, :band_id, :live, presence:true
  belongs_to :band,
  primary_key: :id,
  foreign_key: :band_id,
  class_name: :Band

  has_many :tracks,
  dependent: :destroy,
  primary_key: :id,
  foreign_key: :album_id,
  class_name: :Track
end
