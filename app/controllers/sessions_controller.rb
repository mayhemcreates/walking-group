class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to '/walks'
    else
      redirect_to '/login'
      flash[:alert] = 'Incorrect login, try again'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end

end
