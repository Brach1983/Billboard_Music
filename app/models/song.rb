class Song < ApplicationRecord
	belongs_to :artist

	def info
		"#{self.title} - #{self.artist.name}"
	end
end
