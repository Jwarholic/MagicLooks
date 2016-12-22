class UserMirrorsController < ApplicationController

  def index
    @user = User.find(session[:user_id])
    @mirror = Mirror.find(session[:mirror_id])
    @mirrors = @user.owned_mirrors

    respond_to do |f|
      f.html { render 'index'}
      f.js {}
    end
  end

  def new
    @user_mirror = UserMirror.new
  end

  def create
    @user = User.find_by(name: params[:user_mirror][:name])
    @mirror = Mirror.find(session[:mirror_id])
    @user_mirror = UserMirror.new(name: params[:user_mirror][:name], user_id: @user.id, mirror_id: @mirror.id)

    if @user_mirror.save
      redirect_to @user
    else
      redirect_to @user
    end
  end

  def show
    @mirror = Mirror.find(params[:id])

    respond_to do |f|
      f.html { render 'index'}
      f.js {}
    end
  end

endx