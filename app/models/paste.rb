class Paste < ApplicationRecord

	#guests able to create pastess
	belongs_to :user, optional: true

	after_initialize :init

	def init
		if content.present? && title.blank?
			self.title = "untitled"
		end
	end


	def self.search(params = {}) 
		if params[:search].present?
			return search_results(params[:search])
		else
			return self.all.order(created_at: :desc)
		end
	end


scope :search_results, ->(search) { where('content LIKE ? or title LIKE ?', "%#{search}%","%#{search}%") }

end
