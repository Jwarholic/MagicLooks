class MirrorsSessionsController < ApplicationController
  #skip_before_filter  :verify_authenticity_token
  
  def new
  end

  def create
    @mirror = Mirror.find_by_email(params[:email])
    # If the mirror exists AND the password entered is correct.
    if @mirror && @mirror.authenticate(params[:password])
      # Save the mirror id inside the browser cookie. This is how we keep the mirror 
      # logged in when they navigate around our website.
      session[:mirror_id] = @mirror.id
      redirect_to @mirror
    else
    # If mirror's login doesn't work, send them back to the login form.
      redirect_to new_mirrors_session_path
    end
  end

  def destroy
    session[:mirror_id] = nil
    redirect_to root_path
  end

end