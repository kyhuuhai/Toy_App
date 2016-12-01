class CommentsController < ApplicationController
	before_action :set_comment, only: [:show, :edit, :update, :destroy]
   before_action :logged_in_user, only: [:create, :destroy]

   def show
   end

   def index
   	@comments = Comment.all
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

   # POST /comments
  # POST /comments.json
   def create
   	@comment = current_user.microposts.first.comments.build(comment_params)
   	if @comment.save
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
   end

   def destroy
   end
    private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:content)
    end
end
