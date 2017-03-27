class User::PackagesController < ApplicationController

  def index

  end

  def show
    begin
      selected_package_key = Integer(params[:id])
      puts selected_package_key
      user_package = UserPackage.new
      #puts current_user.inspect
      user_package.user_id = current_user.id
      #user_package.package_id= 2

      case selected_package_key
        when 1
          user_package.package_id= 2
        when 2
          user_package.package_id= 3
        when 3
          user_package.package_id= 4
        when 4
          user_package.package_id= 5
        else
      end

      user_package.save!

      redirect_to new_user_bank_path
    rescue Exception => e
      puts e.message
    end
  end

  # Endpoint for POST /user/packages.json
  # Used to create a new package
  def create
    begin
      if [params[:name], params[:price], params[:description]].none?(&:nil?)
        package = Package.new
        package.name = params[:name]
        package.price = Integer(params[:price])
        package.description = params[:description]

        package.save!

        render json: { status: 'SUCCESS', data: {
            package_name: package.name,
            package_price: package.price,
            package_description: package.description
        }}, status: :ok
      else
        render json: { status: 'ERROR', data: {
            message: 'Invalid parameter set.',
            error_code: 'ERR_0001'
        }}, status: :bad_request
      end
    rescue Exception => e
      puts e.message
    end
  end

end
