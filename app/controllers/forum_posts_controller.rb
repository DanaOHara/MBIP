class ForumPostsController < ApplicationController
  before_action :set_forum_post, only: [:show, :edit, :update, :destroy]

  # GET /forum_posts
  # GET /forum_posts.json
  def index
    @forum_posts = ForumPost.all
  end

  # GET /forum_posts/1
  # GET /forum_posts/1.json
  def show
  end

  # GET /forum_posts/new
  def new
   @forum_post = ForumPost.new
end

  # GET /forum_posts/1/edit
  def edit
  end


  ##############################################

  def postPorDiscusionPrincipal

      @forum_posts = ForumPost.where('discussion = ? ', params[:discussion]).where(parent: 0)
      #render json: @forum_posts

      cookies[:discusion] = {
        value: @forum_posts.pluck(:discussion),
        expires: 10.minutes,
      }

      cookies[:parent] = {
        value: @forum_posts.pluck(:id),
        expires: 10.minutes,
      }
      cookies[:subject] = {
        value: "Re: " + @forum_posts.pluck(:subject).to_s,
        expires: 10.minutes,
      }

      return  @forum_posts

    end


    def postRespuestas

      @forum_posts = ForumPost.where('discussion = ? ', params[:discussion]).where('parent != 0')

        if @forum_posts.nil? == true || @forum_posts.blank? == true

          render :action =>"sinPosts"

        else

          cookies[:discusion] = {
            value: @forum_posts.pluck(:discussion),
            expires: 10.minutes,
          }

          cookies[:parent] = {
            value: @forum_posts.pluck(:parent),
            expires: 10.minutes,
          }
          cookies[:subject] = {
            value: @forum_posts.pluck(:subject),
            expires: 10.minutes,
          }

          return @forum_posts
          #render json: @forum_posts

      end
    end


    def sinPosts

   redirect_to :action =>"sinPosts"

    end

def felicitaciones
end

def error
end

  ##############################################

  # POST /forum_posts
  # POST /forum_posts.json
  def create

    @forum_post = ForumPost.new(forum_post_params)

    @forum_post.created = Time.now.to_i
    @forum_post.modified = Time.now.to_i



        if @forum_post.message.nil? == true || @forum_post.message.blank? == true

      render :action => "error"

      else

      @forum_post.save

      render :action => "felicitaciones"

    end
    #render json: params[:modified]
  end

  # PATCH/PUT /forum_posts/1
  # PATCH/PUT /forum_posts/1.json
  def update
    respond_to do |format|
      if @forum_post.update(forum_post_params)
        format.html { redirect_to @forum_post, notice: 'Forum post was successfully updated.' }
        format.json { render :show, status: :ok, location: @forum_post }
      else
        format.html { render :edit }
        format.json { render json: @forum_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /forum_posts/1
  # DELETE /forum_posts/1.json
  def destroy
    @forum_post.destroy
    respond_to do |format|
      format.html { redirect_to forum_posts_url, notice: 'Forum post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_forum_post
      @forum_post = ForumPost.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def forum_post_params
      params.require(:forum_post).permit(:discussion, :parent, :userid, :subject, :message, :created, :modified)
    end
end
