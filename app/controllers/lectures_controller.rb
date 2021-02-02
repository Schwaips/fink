class LecturesController < ApplicationController
skip_before_action :authenticate_user!, only: [:index, :show]
before_action :set_lecture, only: [:show, :edit, :update]

  def index
    @lectures = Lecture.all
    @schooling = Schooling.new
  end

  def show
    @block = Block.new
  end


  def new
    @lecture = Lecture.new
    @lecture.blocks.build
  end

  def create
    @lecture = Lecture.new(params_lecture)
    @lecture.user = current_user
    # @block = Block.new(content: params[:lecture][:blocks_attributes]["0"][:content], block_type: params[:lecture][:blocks_attributes]["0"][:block_type])
    # @block = Block.new(params[:lecture][:blocks_attributes]["0"])
    if @lecture.save
      flash[:notice] = "Lecture #{@lecture.title} publiée, rajouter du contenu"
      redirect_to edit_lecture_path(@lecture)
    else
      render :new
    end
  end

  def edit
    @lecture = Lecture.find(params[:id])
    @block = Block.new
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
