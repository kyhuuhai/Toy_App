class CommentsController < ApplicationController
	before_action :set_comment , only: [:show, :edit, :update, :destroy]
	before_action :get_Micropost , :get_User, only: [:create, :show , :index ]
   before_action :logged_in_user, only: [:create, :destroy]

  	def show
   	@comment = @micropost.comments.find(params[:id])
  	end

   	def index
   	@comments = @microposts.comments
   	end

  	def edit

   	end

	def new
	@comment = Comment.new
	end

	def home
	@comment = Comment.new
	end

   	def update
      respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment.micropost.user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
   	end

   	def create
   	@comment = current_user.comments.build(comment_params)
    @comment.micropost = @micropost
   	if @comment.save
   		@user = @micropost.user
   		flash[:success] = "Comment Success!"
      redirect_to @user
    else
      @feed_items = []
      render 'static_pages/home'
    end
   	end

   	def destroy
      @comment.destroy
    respond_to do |format|
      format.html { redirect_to @comment.micropost.user, notice: 'Comment was successfully deleted.' }
      format.json { head :no_content }
    end
   	end

    private

    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:content)
    end

    def get_Micropost
    	@micropost = Micropost.find(params[:micropost_id])
    end

    def get_User
      @user = User.find(params[:user_id])
    end
end
