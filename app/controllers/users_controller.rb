class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
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
      redirect_to @user
    else
      render 'new_student'
    end
  end

  def create_teacher
    @user = User.new(teacher_params)
    if @user.save
      flash[:success] = "Register Successfully!"
      redirect_to @user
    else
      render 'new_teacher'
    end
  end

  private
  def student_params
    defaults = {activate: true, role: 2}
    params.require(:user).permit(:username, :password, :password_confirmation, :name, :birthday, :age, :gender, :email, :address).reverse_merge(defaults)
  end

  private
  def teacher_params
    defaults = {activate: false, role: 1}
    params.require(:user).permit(:username, :password, :password_confirmation, :name, :birthday, :age, :gender, :email, :address).reverse_merge(defaults)
  end

end
