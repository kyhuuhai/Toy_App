class CommentsController < ApplicationController
	before_action :set_comment , only: [:show, :edit, :update, :destroy]
	before_action :get_Micropost
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
   	end

   	def create
   	@comment = @micropost.comments.build(comment_params)
   	if @comment.save
   		flash[:success] = "Comment Success!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
   	end

   	def destroy
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
end
