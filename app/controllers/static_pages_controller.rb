class StaticPagesController < ApplicationController

	def home

		if session[:user_id]
			@current_user = User.find(session[:user_id])
		end
		#Load table names to show
		@columns = []
		column_filter = ["password", "created_at", "password_encrypted"]
		User.column_names.each do |column|
			@columns << column unless column_filter.include? column
		end

		@users = User.all
	end
	
end
