class User::DashboardController < User::BaseController
	def index
		@current_user = current_user
		@packages = Package.all
		user_package = UserPackage.find_by(user_id: current_user.id)
		@current_package = Package.find(user_package.package_id).name
	end

  def update_package
		if params[:package_select]
			user_package = UserPackage.find_by(user_id: current_user.id)
			user_package.package_id = Integer(params[:package_select])
			user_package.save
			flash[:package_updated] = 'Your selected package has been updated.'
			redirect_to '/user/dashboard'
		end
	end


  def fire_donate_request
		if Match.where(user_id: current_user.id, completion_status: 'pending').length > 1
			flash[:uncompleted_donations] = 'You have already been matched with two individuals. Please complete these matches first'
			redirect_to '/user/dashboard'
		else
			prospective_up_links = User.where(status: :activated).select { |user| Match.where(matched_user_id: user.id).length < 2 && (UserPackage.find_by(user_id: user.id).package_id == UserPackage.find_by(user_id: current_user.id).package_id) }

			if prospective_up_links.length != 0
				up_link = prospective_up_links[0]

				match = Match.new
				match.user = current_user
				match.matched_user = up_link
				match.save

				redirect_to '/user/dashboard'
			else
				flash[:unable_to_match] = 'We were unable to match you at this moment. Please try again shortly.'
				redirect_to '/user/dashboard'
			end
		end
	end

end