class BlocksController < ApplicationController
before_action :new_block, only: [ :create ]

  def create
    @lecture = Lecture.find(params[:lecture_id])
    @block.lecture = @lecture
    @block.update(params_block)
    if @block.save
      flash[:notice] = "Contenu ajouté à votre lecture"
    else
      flash[:notice] = "Une erreur est survenue, veuillez réesayer."
    end
    redirect_to edit_lecture_path(@lecture)
  end

  private

  def new_block
    @block = Block.new
  end

  def params_block
     params.require(:block).permit(:block_type, :content, photos: [] )
  end

end