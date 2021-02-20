class SchoolingsController < ApplicationController
  before_action :new_schooling, only: [:create, :new]
  before_action :set_lecture, only: [:create, :new]

  def index
    @schoolings = Schooling.where(user: current_user)
  end

  def new
  end

  def create
    @schooling.lecture = @lecture
    @schooling.user = current_user
      if Schooling.where(user: current_user).where(lecture: @lecture).exists?
        redirect_to lectures_path
        flash[:notice] = "Bonne nouvelle, vous suivez déjà ce cours !"
      elsif @schooling.save
        redirect_to lecture_path(@lecture)
        flash[:notice] = "🚀 Vous suivez maintenant ce cours."
      else
        flash[:notice] = "Une erreur est survenue pendant la réservation. 😥"
      end
  end

  def destroy
    @lecture = Lecture.find(params[:id])
    @schooling = Schooling.find_by(user_id: current_user.id, lecture_id: @lecture.id)
    @schooling.destroy
    flash[:notice] = "🗑️ #{@lecture.title} a été retiré"
    redirect_to lecture_path(@lecture)
  end

  private

  def params_schooling
    params.require(:schooling).permit(:user_id, :lecture_id)
  end

  def set_lecture
    @lecture = Lecture.find(params[:lecture_id])
  end

  def new_schooling
    @schooling = Schooling.new
  end
end
