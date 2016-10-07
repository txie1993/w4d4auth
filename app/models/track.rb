class Track < ActiveRecord::Base
  validates :name, :album_id, :bonus, presence:true

  belongs_to :album,
  primary_key: :id,
  foreign_key: :album_id,
  class_name: :Album
end
