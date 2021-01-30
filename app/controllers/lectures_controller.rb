class LecturesController < ApplicationController
skip_before_action :authenticate_user!, only: [:index, :show]
before_action :set_lecture, only: [:show, :edit, :update]

  def index
    @lectures = Lecture.all
  end

  def show
  end

  def edit
  end

  def update
    @lecture.update(params_lecture)
    redirect_to lecture_path(@lecture)
    flash[:notice] = "Votre lecture #{@lecture.title} est à jour, merci!"
  end

private

  def set_lecture
    @lecture = Lecture.find(params[:id])
  end

  def params_lecture
    params.require(:lecture).permit(:title, :description, :category, :photo )
  end
end
