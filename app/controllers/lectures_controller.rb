class LecturesController < ApplicationController
skip_before_action :authenticate_user!, only: [:index, :show]
before_action :set_lecture, only: [:show]

  def index
    @lectures = Lecture.all
  end

  def show
  end

  private

  def set_lecture
    @lecture = Lecture.find(params[:id])
  end

end
