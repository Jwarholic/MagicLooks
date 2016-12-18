class MirrorsController < ApplicationController

    def index
      #@face_ids = User.select { |u| u.face_id }
      @face_ids = {}
      @face_ids["face_info"] = []

      User.all.each do |u|
        @face_ids["face_info"] << {user_id: u.id, user_faceID: u.face_id}
        p @face_ids['face_info']
      end

      respond_to do |f|
        f.html { render json: @face_ids }
        f.js
      end
    end

    def show
      @mirror = Mirror.find(params[:id])
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
    def edit
      @mirror = Mirror.find(params[:id])
    end

    def update
      @user = User.find(params[:user_id])
      @face_id = @user.face_id
      @mirror = Mirror.find(params[:id])

      @mirror.update(face_id: @face_id)
      
      redirect_to user_mirror_path(@user, @mirror)
    end

    def destroy
      @user = User.find(params[:id])
      @face_id = nil
      redirect_to :home
    end

end