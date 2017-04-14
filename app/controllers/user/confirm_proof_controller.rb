class User::ConfirmProofController < ApplicationController

  def index

  end

  def get_unconfirmed_proof_uploads
    begin
      matches = Match.where(matched_user: current_user.id, completion_status: 'pending')
      proof_upload_items = []

      if matches.length >= 1
        matches.each do |match|
          proof_upload = ProofUpload.find_by(match_id: match.id)
          proof_upload_items.push(proof_upload) unless proof_upload.blank?
        end

        render json: { status: 'SUCCESS', data: proof_upload_items }, status: :ok
      else
        render json: { status: 'SUCCESS', data: [] }, status: :ok
      end
    rescue Exception => e
      render json: { status: 'ERROR', data: {
          message: 'An unexpected error occurred'
      }}, status: :internal_server_error
    end
  end

  def download_proof_file
    if params[:id]
      proof_upload = ProofUpload.find(params[:id])
      send_file "#{Rails.root}/public/images/proof_uploads/#{proof_upload.proof_url}", :type => 'image/jpeg', :x_sendfile=>true
    else
      render json: { status: 'ERROR', data:{
          message: 'Please provide a proof id.'
      }}, status: :bad_request
    end
  end

  def confirm_proof
    if params[:id]
      proof_upload = ProofUpload.find(params[:id])
      match = Match.find(proof_upload.match_id)
      proof_upload.destroy
      match.destroy

      down_link_user = User.find(match.user_id)
      down_link_user.set_user_status_to_activated
      down_link_user.save

      #current_user.deactivated!
      current_user.match_count -= 1
      current_user.save

      flash[:confirmation_successful] = 'Proof successfully confirmed.'
      redirect_to '/user/dashboard'

    else
      flash[:error] = 'Invalid proof confirmation attempt.'
    end
  end

end
