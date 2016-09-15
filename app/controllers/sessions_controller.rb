class SessionsController < ApplicationController

  def new
    if logged_in?
      redirect_to home_path
    end
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.activate && user.authenticate(params[:session][:password])
      log_in user
      if user.role == '0'
        redirect_to index_path
      else
        redirect_to home_path
      end
    else
      if user && !user.activate
        flash.now[:danger] = 'Your account is not activated, Please wait!'
      else
        flash.now[:danger] = 'Invalid username/password combination'
      end
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end

end
