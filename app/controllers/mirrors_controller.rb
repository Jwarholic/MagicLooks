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
      # @user = User.find(params[:user_id])
      # @face_id = @user.face_id
      @mirror = Mirror.find(params[:id])

      # @mirror.update(face_id: @face_id)
      # redirect_to user_mirror_path(@user, @mirror)

      respond_to do |f|
        f.html { render json: @mirror }
        f.js { render json: @mirror }
      end

    end

end