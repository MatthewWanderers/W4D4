# == Schema Information
#
# Table name: tracks
#
#  id       :integer          not null, primary key
#  title    :string           not null
#  ord      :integer          not null
#  lyrics   :text
#  regular  :integer          not null
#  album_id :integer
#

class Track < ApplicationRecord
  validates :title, :ord, :regular, :album_id, presence: true

  belongs_to :album,
  foreign_key: :album_id

  has_one :band,
  through: :album,
  source: :band
end
