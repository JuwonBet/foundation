class PagesController < ApplicationController
  def index
    unless current_user.nil?
      redirect_to '/user/dashboard'
    end
  end
  
  def contact

  end
  
  def ideologies
    
  end
  
  def about
  end 
  
  def packages
    
  end

  def select_package

  end
  
end
