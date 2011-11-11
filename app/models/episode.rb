class Episode < ActiveRecord::Base
  belongs_to :show
  has_many :subtitles
end
