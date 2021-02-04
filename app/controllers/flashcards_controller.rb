class FlashcardsController < ApplicationController

  def new
    @flashcard = Flaschard.new
  end

  def create
    @block = Block.find(params[block_id])
    @flashcard.block = @block
    @flashcard.update(params_flashcard)
  if @flashcard.save
      flash[:notice] = "Flashcard ajouté à votre lecture"
    else
      flash[:notice] = "Une erreur est survenue, veuillez réesayer."
    end
    redirect_to block_path(@block)
  end

  def params_flashcards
    params.require(:flashcard).permit(:question)
  end

end
