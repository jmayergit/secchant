class TopicsController < ApplicationController
  before_action :require_login, except: :show
  before_action :format_post_params, only: :create

  def new
    @forum = Forum.find(params[:forum])

    @topic = Topic.new
  end

  def create
    @topic = Topic.new(topic_params)
    @topic.user_id = current_user.id

    if @topic.save
      redirect_to topic_show_path(@topic)
    else
      flash[:error] = "Subject cannot be blank."
      redirect_to topic_new_path(:forum => params[:topic][:forum_id])
    end
  end

  def show
    @topic = Topic.find(params[:id])
    @posts = @topic.posts.order(created_at: :asc).page(params[:page])
  end

  def edit
    @topic = Topic.find(params[:id])
    @post = @topic.posts.first
    @forum = @topic.forum
  end

  def update
    @topic = Topic.find(params[:id])

    if @topic.update(topic_params)
      @topic.posts.first.update(message: params[:topic][:post][:message])
      redirect_to topic_show_path(@topic)
    else
      flash[:error] = "Subject cannot be blank."
      redirect_to topic_path(@topic)
    end
  end

  def sticky
    @topic = Topic.find(params["topic"]["id"])

      if @topic.stickied == false
        @topic.update(stickied: true)
        if @topic.anchored == true
          @topic.update(anchored: false)
        end
      else
        @topic.update(stickied: false)
      end

    redirect_to forum_show_path(@topic.forum.id)
  end

  def anchor
    @topic = Topic.find(params["topic"]["id"])

    if @topic.anchored == false
      @topic.update(anchored: true)
      if @topic.stickied == true
        @topic.update(stickied: false)
      end
    else
      @topic.update(anchored: false)
    end

    redirect_to forum_show_path(@topic.forum.id)
  end

  private

    def topic_params
      params.require(:topic).permit(:subject, :forum_id, posts_attributes: [:message, :user_id, :id])
    end

    def require_login
      unless user_signed_in?
        flash[:error] = "You must be logged on in order to post on this board."

        redirect_to new_user_session_path
      end
    end

    def format_post_params
      # nested attributes for has_many expects an array
      postAttrs = params["topic"]["posts_attributes"]
      postAttrs["user_id"] = current_user.id
      wrappedPostAttrs = [postAttrs]
      params["topic"]["posts_attributes"] = wrappedPostAttrs
    end
end
