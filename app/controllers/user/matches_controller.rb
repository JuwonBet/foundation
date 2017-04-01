class User::MatchesController < ApplicationController

  # Endpoint for
  # Used to retrieve down link user matches
  # Solely a json endpoint
  def get_down_link_matches
    begin
      user_id = current_user.id

      if Match.exists?(matched_user_id: user_id, completion_status: 'pending')
        match = Match.where(matched_user_id: user_id, completion_status: 'pending')

        if match.length > 1
          down_link_users = []

          match.each do |m|
            down_link_user = User.find_by(id: m.user_id)
            down_link_users.push(down_link_user)
          end
        else
          down_link_users = User.find_by(id: match[0].user_id)
        end
        #down_link_user = User.find_by(id: match.user_id)

        if down_link_users.is_a?(Array)
          render json: { status: 'SUCCESS', data: [
              {
                  first_name: down_link_users[0].first_name,
                  last_name: down_link_users[0].last_name,
                  phone_number: down_link_users[0].phone_number,
                  user_id: down_link_users[0].id
              },
              {
                  first_name: down_link_users[1].first_name,
                  last_name: down_link_users[1].last_name,
                  phone_number: down_link_users[1].phone_number,
                  user_id: down_link_users[1].id
              }
          ]}, status: :ok
        else
          render json: { status: 'SUCCESS', data: [
              {
                  first_name: down_link_users.first_name,
                  last_name: down_link_users.last_name,
                  phone_number: down_link_users.phone_number,
                  user_id: down_link_users.id
              }
          ]}, status: :ok
        end
      else
        render json: { status: 'SUCCESS', data: '' }, status: :ok
      end

    rescue Exception => e
      puts e.message

      render json: { status: 'ERROR', data: {
          message: 'An unexpected error occurred. Please try againlater'
      }}, status: :internal_server_error
    end
  end

  # Endpoint for
  # Used to retrieve up link user matches
  # Solely a json endpoint
  def get_up_link_matches
    begin
      user_id = current_user.id

      if Match.exists?(user_id: user_id, completion_status: 'pending')
        match = Match.find_by(user_id: user_id, completion_status: 'pending')
        up_link_user = User.find_by(id: match.matched_user_id)
        up_link_user_bank = Bank.find_by(user_id: up_link_user.id)
        bank_name = up_link_user_bank.name
        account_number = up_link_user_bank.account_number

        render json: { status: 'SUCCESS', data: {
            first_name: up_link_user.first_name,
            last_name: up_link_user.last_name,
            phone_number: up_link_user.phone_number,
            user_id: up_link_user.id,
            match_id: match.id,
            account_number: account_number,
            bank_name: bank_name
        }}, status: :ok
      else
        render json: { status: 'SUCCESS', data: '' }, status: :ok
      end

    rescue Exception => e
      puts e.message

      render json: { status: 'ERROR', data: {
          message: 'An unexpected error occurred. Please try againlater'
      }}, status: :internal_server_error
    end
  end

end
