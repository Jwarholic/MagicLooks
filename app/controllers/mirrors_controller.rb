class MirrorsController < ApplicationController

    def index
      @mirror = Mirror.find(session[:mirror_id])

      respond_to do |f|
        f.html { render json: { mirror_id: session[:mirror_id], owner_id: @mirror.owner_id } }
      end
    end

    def show
      @mirror = Mirror.find(session[:mirror_id])
      if @mirror.person_id != nil
          @user = User.find_by(person_id: @mirror.person_id)
          p @user.name
          status = "true"
          respond_to do |f|
              f.html { render json: { status: status, user_name: @user.name } }
          end
      else
            status = "false"
            respond_to do |f|
                f.html { render json: { status: status } }
            end
      end
    end

    def new
      @mirror = Mirror.new

      respond_to do |format|
        format.html { render 'new' }
        format.js {}
      end

    end

    def edit
      @mirror = Mirror.find(params[:id])
    end

    def create
      @user = User.find(current_user)
      @mirror = Mirror.new(name: params[:name], owner_id: @user.id, email: @user.email, password_digest: params[:password])

      if @mirror.save

        respond_to do |f|
          f.html { redirect_to mirror_path(@mirror) }
          f.js {}
        end

      else
        redirect_to :back
      end

    end

    def update
      # @user = User.find(params[:user_id])
      # @person_id = @user.person_id
      @mirror = Mirror.find(params[:id])
      
        if @mirror.update(person_id: params[:personId])

        respond_to do |f|
          f.html { render  json: { status: 'successful' } }
        end
      else
        respond_to do |f|
          f.html { render json: { status: 'unsuccessful' } }
        end
      end
      
      # @mirror.update(person_id: params[:person_id])
      
      # redirect_to user_mirror_path(@user, @mirror)
    end

    def destroy
      @mirror = Mirror.find(params[:id])
      @mirror.update(person_id: nil)

      respond_to do |format|
       format.html { render json: { status: 'successful' } }
      end

    end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

end