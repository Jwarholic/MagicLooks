class UserMirrorsController < ApplicationController

  def index
    @user = User.find(session[:user_id])
    p @user
    @mirror = Mirror.find(session[:mirror_id])
    p @mirror
    @mirrors = @user.owned_mirrors

    respond_to do |f|
      f.html { render 'index'}
      f.js {}
    end
  end

  def new
    @user_mirror = UserMirror.new()
    # respond_to do |f|
    #   f.html { render 'new'}
    #   f.js {}
    # end
  end

  def create
    p "*" * 77
    p "params   : "
    p params[:user_mirror][:name]
    p "*" * 77
    @user = User.find_by(name: params[:user_mirror][:name])
    @mirror = Mirror.find(session[:mirror_id])
    p "*" * 59
    p @user
    p "*" * 59
    p "L" * 88
    p @mirror
    p "L" * 88
    @user_mirror = UserMirror.new(user_id: @user.id, mirror_id: @mirror.id)

    if @user_mirror.save
      redirect_to @user
    else
      respond_to do |f|
        f.html { render 'users-mirrors'}
        f.js {}
      end
    end
  end

  def show
    @mirror = Mirror.find(params[:id])

    respond_to do |f|
      f.html { render 'index'}
      f.js {}
    end
  end

end