class CoursesController < ApplicationController

  def index
    @courses = Course.all
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
      flash[:success] = "Create Successfully!"
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
      flash[:success] = "Course updated"
      # redirect_to home_path(@user)
    else
      render 'edit'
    end
  end

  private
  def course_params
    params.require(:course).permit(:user_id, :name, :subjects, :code, :start_date, :end_date, :class_time_start, :class_time_end, :image, :limit_student_number, :description)
  end

end
