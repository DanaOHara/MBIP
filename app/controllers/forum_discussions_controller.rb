class ForumDiscussionsController < ApplicationController
  before_action :set_forum_discussion, only: [:show, :edit, :update, :destroy]

  # GET /forum_discussions
  # GET /forum_discussions.json
  def index
    @forum_discussions = ForumDiscussion.all
  end

  # GET /forum_discussions/1
  # GET /forum_discussions/1.json
  def show
  end

  # GET /forum_discussions/new
  def new
    @forum_discussion = ForumDiscussion.new
  end

  # GET /forum_discussions/1/edit
  def edit
  end

  ####################################################

  def discusionesPorForo

  @forum_discussions = ForumDiscussion.select(:id,:name,:course).where("forum = ?", params[:forum])

  if @forum_discussions.nil? == true || @forum_discussions.blank? == true

    render :action =>"sinDiscusiones"

  else

    return  @forum_discussions
    #return render json: @forum_discussions

    end

  end


  def sinDiscusiones

  redirect_to :action =>"sinDiscusiones"

  end


  ####################################################

  # POST /forum_discussions
  # POST /forum_discussions.json
  def create
    @forum_discussion = ForumDiscussion.new(forum_discussion_params)

    respond_to do |format|
      if @forum_discussion.save
        format.html { redirect_to @forum_discussion, notice: 'Forum discussion was successfully created.' }
        format.json { render :show, status: :created, location: @forum_discussion }
      else
        format.html { render :new }
        format.json { render json: @forum_discussion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /forum_discussions/1
  # PATCH/PUT /forum_discussions/1.json
  def update
    respond_to do |format|
      if @forum_discussion.update(forum_discussion_params)
        format.html { redirect_to @forum_discussion, notice: 'Forum discussion was successfully updated.' }
        format.json { render :show, status: :ok, location: @forum_discussion }
      else
        format.html { render :edit }
        format.json { render json: @forum_discussion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /forum_discussions/1
  # DELETE /forum_discussions/1.json
  def destroy
    @forum_discussion.destroy
    respond_to do |format|
      format.html { redirect_to forum_discussions_url, notice: 'Forum discussion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_forum_discussion
      @forum_discussion = ForumDiscussion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def forum_discussion_params
      params.require(:forum_discussion).permit(:course, :forum, :name, :firstpost, :userid, :groupid, :assessed, :timemodified, :usermodified, :timestart, :timeend)
    end
end
