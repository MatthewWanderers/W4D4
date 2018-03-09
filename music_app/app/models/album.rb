# == Schema Information
#
# Table name: albums
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  title      :string           not null
#  year       :integer          not null
#  live       :integer          not null
#  band_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Album < ApplicationRecord
  validates :name, :title, :band_id, :year, :live, presence: true

  belongs_to :band,
  foreign_key: :band_id

  has_many :tracks,
  foreign_key: :album_id,
  dependant: :destroy

end
