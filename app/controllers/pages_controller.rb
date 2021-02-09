class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :dashboard ]

  def home
  end

  def dashboard
    @students = current_user.students
  end

  def manage_courses
    @lectures = Lecture.where(user: current_user)
    @block = Block.new
  end

end
