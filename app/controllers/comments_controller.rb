class CommentsController < ApplicationController
	before_action :set_resources, except: :create
	def create
		@post = Post.find(params[:post_id])
		@comment = Comment.new(content: params[:comment][:content])
		@comment.post = @post #asociando en atributo post sea el contenido de post

		@comment.save

		redirect_to @post
	end

	def destroy
		@comment.destroy
		redirect_to @post
	end

	def edit
	end

	def update
		@comment.update(content: params[:comment][:content])
		redirect_to @post
	end

	private
	def set_resources #repite el metodo en el before action 
		@post = Post.find(params[:post_id])
		@comment = Comment.find(params[:id])
	end
end
