class SocialMediaLink < ActiveRecord::Base
  belongs_to :user
  # validates :link, format: { with: URI.regexp(['http', 'https']) }
validates :link, :url => true # Could be combined with `allow_blank: true`
validates_presence_of :link
end
