class User::DashboardController < User::BaseController
	def index
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
end