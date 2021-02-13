class BlocksController < ApplicationController
before_action :new_block, only: [ :create ]

  def new
    @block = Block.new
    @lecture = Lecture.find(params[:lecture_id])
    @navbar_side = true
    @lectures = Lecture.where(user: current_user)
  end

  def create
    @lecture = Lecture.find(params[:lecture_id])
    @block.lecture = @lecture
    @block.update(params_block)
    if @block.save
      flash[:notice] = "Chapitre #{@block.title} ajouté à votre cours"
    else
      flash[:notice] = "Une erreur est survenue, veuillez réesayer."
    end
    redirect_to edit_lecture_path(@lecture)
  end

  # def edit
  #   @block = Block.find(params[:id])
  #   @lecture = Lecture.find(params[:lecture_id])
  # end

  def update
    @block = Block.find(params[:id])
    @lecture = Lecture.find(params[:lecture_id])
    @block.update(params_block)
    redirect_to edit_lecture_path(@lecture)
    flash[:notice] = "Le chapitre #{@block.title} est à jour, merci!"
  end

  private

  def new_block
    @block = Block.new
  end

  def params_block
     params.require(:block).permit(:block_type, :content, :title, photos: [])
  end
end
