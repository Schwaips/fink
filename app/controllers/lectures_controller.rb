class LecturesController < ApplicationController
skip_before_action :authenticate_user!, only: [:index, :show]
before_action :set_lecture, only: [:show, :edit, :update]

  def index
    @lectures = Lecture.all
    @schooling = Schooling.new
    @following = current_user.lectures_as_pupil
    @teaching = Lecture.teaching_lectures(current_user)
    @other_lectures = []
    @other_categories = []

    @lectures.each do |lecture|
      unless @following.include?(lecture) || @teaching.include?(lecture)
        @other_lectures << lecture
        @other_categories << lecture.category
      end
    end

    @other_categories = @other_categories.uniq
  end

  def show
  end

  # send message from edit lecture
  def message_slack
    @message = message_params[:message]
    @lecture = Lecture.find(params[:lecture_id])
    if SendMessageSlackJob.perform_now(@message, current_user.slack_workspace_uid, @lecture.channel_id)
      redirect_to edit_lecture_path(@lecture)
      flash[:notice] = "Message envoyé sur le canal"
    else
      flash[:alert] = "Erreur dans l'envoi de votre message, veuillez réessayer."
    end
  end

  # api to join a channel on show lecture
  def user_join_channel
    @lecture = Lecture.find(params[:lecture])
    @user = current_user
    join_channel_slack
    flash[:notice] = "Vous avez rejoins le canal sur Slack, félicitations! Ouvrez maintenant slack et échangez avec les profs et les élèves..."
    redirect_to lecture_path(@lecture)
  end

  def new
    @lecture = Lecture.new
    @lecture.blocks.build
    @lectures = Lecture.where(user: current_user)
    @navbar_side = true
  end

  def create
    @navbar_side = true
    @lectures = Lecture.where(user: current_user )
    @lecture = Lecture.new(params_lecture)
    @lecture.user = current_user
    if @lecture.save
      create_slack_channel
      flash[:notice] = "Le cours #{@lecture.title} a bien été créé, rajouter maintenant du contenu"
      redirect_to new_lecture_block_path(@lecture)
    else
      render :new
    end
  end

  def edit
    @navbar_side = true
    @lectures = Lecture.where(user: current_user)
    @lecture = Lecture.find(params[:id])
    # @block = params[:block_id] ?  Block.find(params[:block_id]) : Block.new
    # respond_to do |format|
    #   format.js { render :file => "app/views/lectures/edit.js.erb" }
    # end
  end

  def update
    @navbar_side = true
    @lectures = Lecture.where(user: current_user)
    @lecture.update(params_lecture)
    redirect_to edit_lecture_path(@lecture)
    flash[:notice] = "Votre cours #{@lecture.title} est à jour, merci!"
  end

  def destroy
    @navbar_side = true
    @lectures = Lecture.where(user: current_user)
    @lecture = Lecture.find(params[:id])
    if @lecture.destroy
      flash[:notice] = "Le cours #{@lecture.title} est bien supprimé, merci"
      redirect_to dashboard_path
    else
      render :show
    end
  end

private

  def set_lecture
    @lecture = Lecture.find(params[:id])
  end

  def params_lecture
    params.require(:lecture).permit(:title, :description, :category, :photo, :channel_id )
  end

  def create_slack_channel
    # parametre de slack :
    create_conv = RestClient.post 'https://slack.com/api/conversations.create', {
      name: @lecture.title.to_s.parameterize
    },
    {
      Authorization:"Bearer #{ENV["SLACK_TOKEN"]}"
    }
    @lecture.channel_id = JSON.parse(create_conv).dig("channel", "id")
    @lecture.save
    p "--- Body creation conv slack---"
    # p create_conv.body
    p "--- End of message create conv slack ---"
  end

  def join_channel_slack
    channel_id = @lecture.channel_id
    join = RestClient.post 'https://slack.com/api/conversations.invite', {
      channel: channel_id, users: current_user.slack_workspace_uid
    },
    {
      Authorization:"Bearer #{ENV["SLACK_TOKEN"]}"
    }
    p "---join channel slack---"
    p join.body
    p "--- end of join slack---"
  end

  def message_params
    params.require(:lecture).permit(:message)
  end
end
