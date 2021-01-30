class SchoolingsController < ApplicationController

  def show
    @schooling = Schooling.all
  end

  def new
    @schooling = Schooling.new
    @lecture = Lecture.find(params[:lecture_id])
  end

  def create
    @schooling = Schooling.new(params_schooling)
    @lecture = Lecture.find(params[:lecture_id])
    @schooling.lecture = @lecture
    @schooling.user = current_user
      if @booking.save
        flash[:notice] = "Inscription validée."
      end
  end


  private

  def params_schooling
     params.require(:schooling).permit(:user_id, :lecture_id)
  end

end
