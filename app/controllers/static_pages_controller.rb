class StaticPagesController < ApplicationController

	def home
		@columns = []
		column_filter = ["password", "created_at", "password_encrypted"]
		User.column_names.each do |column|
			@columns << column unless column_filter.include? column
		end
	end
	
end
