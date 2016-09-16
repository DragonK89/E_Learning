class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :show]
  before_action :correct_user, only: [:index]

  def index
    @users = User.all
  end

  def show
    @user = User.find(current_user)
  end

  def new_student
    @user = User.new
    render 'new_student'
  end

  def new_teacher
    @user = User.new
    render 'new_teacher'
  end

  def create_student
    @user = User.new(student_params)
    if @user.save
      log_in @user
      flash[:success] = "Register Successfully!"
      redirect_back_or @user
    else
      render 'new_student'
    end
  end

  def create_teacher
    @user = User.new(teacher_params)
    if @user.save
      log_in @user
      flash[:success] = "Register Successfully!"
      redirect_back_or @user
    else
      render 'new_teacher'
    end
  end

  def edit
    @user = User.find(current_user)
    if @user.birthday !=''
      @user.birthday = (Date.parse @user.birthday).strftime('%Y-%m-%d')
    end
  end

  def update
    @user = User.find(current_user)
    if @user.update_attributes(edit_params)
      flash[:success] = "Profile updated"
      redirect_to home_path
    else
      render 'edit'
    end
  end

  def change_status
    @user = User.find(params[:id])
    if @user.update_attributes(edit_params)
      flash[:success] = "Profile updated"
      redirect_to index_path
    else
      render 'index'
    end
  end

  private
  def student_params
    defaults = {activate: true, role: 2}
    params.require(:user).permit(:username, :password, :password_confirmation, :name, :birthday, :age, :gender, :email, :phone, :address, :activate).reverse_merge(defaults)
  end

  private
  def teacher_params
    defaults = {activate: false, role: 1}
    params.require(:user).permit(:username, :password, :password_confirmation, :name, :birthday, :age, :gender, :email, :phone, :address, :activate).reverse_merge(defaults)
  end

  private
  def edit_params
    params.require(:user).permit(:username, :password, :password_confirmation, :name, :birthday, :age, :gender, :email, :phone, :address, :activate, :role)
  end

  # Confirms a logged-in user.
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please login!"
      redirect_to login_url
    end
  end

  # Confirms the correct user.
  def correct_user
    redirect_to(home_path) unless current_user_admin?
  end

end
