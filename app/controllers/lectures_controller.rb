class LecturesController < ApplicationController
skip_before_action :authenticate_user!, only: [:index, :show]
before_action :set_lecture, only: [:show, :edit, :update]

  def index
    @lectures = Lecture.all
    @schooling = Schooling.new
  end

  def show
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
    # @block = Block.new(content: params[:lecture][:blocks_attributes]["0"][:content], block_type: params[:lecture][:blocks_attributes]["0"][:block_type])
    # @block = Block.new(params[:lecture][:blocks_attributes]["0"])
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
    params.require(:lecture).permit(:title, :description, :category, :photo )
  end

  def create_slack_channel
    # parametre de slack :
    create_conv = RestClient.post 'https://slack.com/api/conversations.create', { name: @lecture.title.to_s.parameterize }, {Authorization:"Bearer #{ENV["SLACK_TOKEN"]}"}
    channel_id = JSON.parse(create_conv).dig("channel", "id")
    join_conv = RestClient.post 'https://slack.com/api/conversations.invite', { channel: channel_id, users: current_user.slack_workspace_uid }, {Authorization:"Bearer #{ENV["SLACK_TOKEN"]}"}
    p join_conv.body
  end

end
