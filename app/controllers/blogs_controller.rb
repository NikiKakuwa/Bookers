class BlogsController < ApplicationController
  def welcome
  end

  def index
  	@blogs = Blog.all
  	@blog = Blog.new
  end

  def show
  	@blog = Blog.find(params[:id])
  end

  def new
  	@blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    if @blog.save
      redirect_to blog_path(@blog)
      flash[:success] = 'successfully posted!!!'
    else
      @blogs = Blog.all
      render action: :index
    end

  end

  def edit
  	@blog = Blog.find(params[:id])
  end

  def update
    blog = Blog.find(params[:id])
    if blog.update(blog_params)
      redirect_to blog_path(blog)
      flash[:success] = 'successfully edited!!!'
    else
      @blog = blog
      render action: :edit
    end
  end

  def destroy
    blog = Blog.find(params[:id])
    blog.destroy
    redirect_to blogs_path
    flash[:success] = 'successfully destroyed!!!'
  end

    private
    def blog_params
      params.require(:blog).permit(:title, :body)
    end
end
