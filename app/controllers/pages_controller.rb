class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def dashboard
    @students = current_user.students
  end

  def manage_courses
    @lectures = Lecture.where(user: current_user)
    @block = Block.new
    # @lecture = Lecture.find(params[:lecture_id])
  end

  def search
    if params[:query].present?
      sql_query = "title ILIKE :query OR category ILIKE :query"
      @lectures = Lecture.where(sql_query, query: "%#{params[:query]}%")
    else
      redirect_to(request.referrer || root_url)
    end
  end
end
