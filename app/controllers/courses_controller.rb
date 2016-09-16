class CoursesController < ApplicationController

  def index
    user = current_user
    @courses = user.courses
  end

  def all_classes
    @courses = Course.all
    render 'all_courses'
  end

  def show
    @courses = Course.find(params[:id])
  end

  def new
    @courses = Course.new
  end

  def create
    @courses = Course.new(course_params)
    if @courses.save
      flash[:success] = "Class Created!"
      redirect_to my_classes_path
    else
      render 'new'
    end
  end

  def edit
    @courses = Course.find(params[:id])
  end

  def update
    @courses = Course.find(params[:id])
    if @courses.update_attributes(course_params)
      flash[:success] = "Class Updated!"
      redirect_to my_classes_path
    else
      render 'edit'
    end
  end

  private
  def course_params
    defaults = {user: current_user}
    params.require(:course).permit(:user_id, :name, :subjects, :code, :start_date, :end_date, :class_time_start, :class_time_end, :image, :limit_student_number, :description).reverse_merge(defaults)
  end

end
