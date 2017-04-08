class PagesController < ApplicationController
  def index
     if current_user //returns nil if not logged in
          @users = User.all
          render :dashboard
       end
    end

    def dashboard
       @users = User.all
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
