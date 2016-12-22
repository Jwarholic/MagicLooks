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
    @user = User.new()
    @user_mirror = UserMirror.new()
  end

  def create
    @user = User.find_by(name: params[:name])
    @mirror = Mirror.find(params[:id])
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