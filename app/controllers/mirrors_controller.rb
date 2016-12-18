class MirrorsController < ApplicationController

    def index
      #@face_ids = User.select { |u| u.face_id }
      @face_ids = {}
      @face_ids["face_id"] = []

      User.all.each do |u|
        @face_ids["face_id"] << u.face_id
      end

      respond_to do |f|
        f.html { render json: @face_ids }
        f.js
      end
    end

    # def new
    #     @user = User.find_by_email(params[:email])
    #     if @user && @user.authenticate(params[:password])
    #       # Save the user id inside the browser cookie. This is how we keep the user 
    #       # logged in when they navigate around our website.
    #       session[:user_id] = @user.id
    #       redirect_to index
    #   end
    # end
    def show
      @mirror = Mirror.find(params[:id])
    end

    def update
      @face_id = params[:face_id]
      @mirror = Mirror.find(params[:mirror_id])

      @mirror.update(face_id: @face_id)
      redirect_to mirror_path(@mirror)
    end

end