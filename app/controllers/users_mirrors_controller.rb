class UsersMirrorsController < ApplicationController

  def new
    @user = User.find(@current_user)
    @mirrors = @user.owned_mirrors
  end

  def create
    @user = User.find(@current_user)
    @mirrors = @user.owned_mirrors
    
    respond_to do |f|
      f.html { render 'users-mirrors'}
      f.js {}
    end
  end

end