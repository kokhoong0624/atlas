class Paste < ApplicationRecord
	belongs_to :user, optional: true

	after_initialize :init

	def init
		if content.present? && title.blank?
			self.title = "untitled"
		end
	end

end
