class SchoolingsController < ApplicationController
before_action :set_lecture, only: [:create, :new]

  def index
    @schoolings = Schooling.where(user: current_user)
  end

  def new
    @schooling = Schooling.new
  end

  def create
    @schooling = Schooling.new
    @schooling.lecture = @lecture
    @schooling.user = current_user
      if Schooling.where(user: current_user).where(lecture: @lecture).exists?
        redirect_to lectures_path
        flash[:notice] = "Vous suivez déjà ce cours."
      elsif @schooling.save
        redirect_to lecture_path(@lecture)
        flash[:notice] = "Vous suivez mainteant ce cours."
      else
        flash[:notice] = "Une erreur est survenue pendant la réservation."
      end
  end

  private

  def params_schooling
     params.require(:schooling).permit(:user_id, :lecture_id)
  end

  def set_lecture
    @lecture = Lecture.find(params[:lecture_id])
  end

end
