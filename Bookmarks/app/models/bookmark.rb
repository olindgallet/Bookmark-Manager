class Bookmark < ActiveRecord::Base
  scope :public, where(:visibility => "public")
end
