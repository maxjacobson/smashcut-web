class Screenplay < ActiveRecord::Base
  validates :fountain, :author_name, :title, :password, presence: true
end
