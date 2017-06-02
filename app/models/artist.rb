class Artist < ApplicationRecord
	has_many :songs, dependent: :destroy
	validates_presence_of :name
end
