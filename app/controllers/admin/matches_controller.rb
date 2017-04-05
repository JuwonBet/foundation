class Admin::MatchesController < Admin::BaseController

	def index
		@users = User.all.sort_by(&:created_at)
    @users = @users.reverse
    @matches = Match.all
	end

	def new
		@match = Match.new
	end

  def create
    @user = User.find(match_params[:user_id])
    @user.matched_user_ids = match_params[:matched_user_id]

     respond_to do |format|
        if @user.save
          format.html { redirect_to admin_dashboard_path, notice: 'matches were successfully created.' }
          # format.json { render :show, status: :created, location: @match }
        else
          format.html { render :new }
          # format.json { render json: @match.errors, status: :unprocessable_entity }
        end
      end
  end

  def retriever_match(user_id)
    yield Match.find_by(user_id: user.id)
  end

  private
  def match_params
  	params.require(:match).permit(:user_id, matched_user_id: [])
  end

end