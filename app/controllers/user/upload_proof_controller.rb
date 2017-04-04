require 'fileutils'

class User::UploadProofController < ApplicationController

  def index

  end

  def create

    if Match.exists?(id: params[:match_id], user_id: current_user.id)
      #extension = params[:upload_file].original_filename.split('.')[1]
      #name = params[:match_id] << '.' << extension #params[:upload][:file].original_filename
      #directory = "#{Rails.root}/public/images/proof_uploads"
      #path = File.join(directory, name)
      #File.open(path, 'wb') { |f| f.write(params[:upload_file].read) }

      proof_upload = ProofUpload.new
      proof_upload.match = Match.find(params[:match_id])
      proof_upload.account_name = params[:user_name]
      proof_upload.phone_number = params[:phone_number]
      proof_upload.account_number = params[:account_number]
      #proof_upload.proof_url = name
      proof_upload.save

      redirect_to '/user/dashboard'

    else
      flash[:error_message] = 'Invalid upload details. Please cross check form'
    end

  end

end
