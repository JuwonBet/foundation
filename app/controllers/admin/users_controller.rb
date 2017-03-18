class Admin::UsersController < Admin::BaseController
  before_action :find_user, except: [:new, :index, :create]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Successfully created User." 
      redirect_to admin_users_path
    else
      render :action => 'new'
    end
  end

  def show
  end

  def edit
  end


  def update
    @user = User.find(params[:id])
    params[:user].delete(:password) if params[:user][:password].blank?
    params[:user].delete(:password_confirmation) if params[:user][:password].blank? and params[:user][:password_confirmation].blank?
    if @user.update_attributes(user_params)
      flash[:notice] = "Successfully updated User."
      redirect_to admin_users_path
    else
      render :edit
    end
  end

  def destroy
    if @user.destroy
      flash[:notice] = "Successfully deleted User."
      redirect_to admin_users_path
      else
      flash[:alert] = "Error deleting user!"
    end
  end

  private

 	def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :phone_number, :password_confirmation, :status)
  end

  def find_user
    @user = User.find(params[:id])
  end
end