module ChatroomsHelper
	def current_page
		current_page = params[:id]
		current_page.to_i
	end

end
