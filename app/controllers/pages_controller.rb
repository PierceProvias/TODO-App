class PagesController < ApplicationController
  
  def home
    
  end

  def profile
    if Current.user    
    else
      redirect_to root_path, notice: "Please sign in first"
    end
  end

  
end
