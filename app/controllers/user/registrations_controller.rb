class User::RegistrationsController < Devise::RegistrationsController

  protected 

  def after_sign_up_path_for(resource)
    new_user_bank_path
  end
end
