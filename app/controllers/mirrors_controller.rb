class MirrorsController < ApplicationController

    def index
      #@face_ids = User.select { |u| u.person_id }
      @face_ids = {}
      @face_ids["person_id"] = []

      User.all.each do |u|
        @face_ids["person_id"] << {user_id: u.id, user_faceID: u.person_id}
        p @face_ids['person_id']
      end

      respond_to do |f|
        f.html { render json: @face_ids }
      end
    end

    def show
      @mirror = Mirror.find(params[:id])
      @user = User.find(params[:id])

      respond_to do |f|
        f.html { render  :show }
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

    def edit
      @mirror = Mirror.find(params[:id])
    end

    def update
      @user = User.find(params[:user_id])
      @person_id = @user.person_id
      @mirror = Mirror.find(params[:id])

      @mirror.update(person_id: @person_id)
      
      redirect_to user_mirror_path(@user, @mirror)
    end

    def destroy
      @mirror = Mirror.find(params[:id])
      @mirror.update(person_id: nil)

      respond_to do |format|
       format.html { render json: { response: 'success' } }
      end

    end

end