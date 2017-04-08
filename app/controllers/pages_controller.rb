class PagesController < ApplicationController
  def index
     if current_user //returns nil if not logged in
          render :dashboard
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
