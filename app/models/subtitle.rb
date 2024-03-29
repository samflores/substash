require 'carrierwave/orm/activerecord'

class Subtitle < ActiveRecord::Base
  belongs_to :episode

  scope :top_downloads, order('downloads DESC').limit(10)
  scope :newest, order('updated_at DESC').limit(10)

  mount_uploader :file, FileUploader
end
