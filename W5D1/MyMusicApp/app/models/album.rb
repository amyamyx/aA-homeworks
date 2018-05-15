# == Schema Information
#
# Table name: albums
#
#  id         :bigint(8)        not null, primary key
#  title      :string           not null
#  year       :integer          not null
#  studio     :boolean          not null
#  band_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Album < ApplicationRecord
  validates :title, :year, :studio, :band_id, presence: true
  validates :studio, inclusion: [ true, false ]

  belongs_to :band,
    primary_key: :id,
    foreign_key: :band_id,
    class_name: :Band
end
