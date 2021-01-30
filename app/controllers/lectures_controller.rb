class LecturesController < ApplicationController
skip_before_action :authenticate_user!, only: [:index, :show]
before_action :set_lecture, only: [:show, :edit, :update]

  def index
    @lectures = Lecture.all
  end

  def show
  end


  def new
    @lecture = Lecture.new
  end

  def create
    @lecture = Lecture.new(params_lecture)
    @lecture.user = current_user
    if @lecture.save
      flash[:notice] = "La #{@lecture.title} est maintenant publiée, merci"
      redirect_to lecture_path(@lecture)
    else
      render :new
    end
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
