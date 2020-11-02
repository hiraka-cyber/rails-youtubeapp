class MoviesController < ApplicationController
  before_action :authenticate_user!, only: [:show, :create]
  def index
      @movies = Movie.all
  end

  def show
      @movie = Movie.find(params[:id])
      @like = Like.new
  end

  def new
      @movie = Movie.new
  end

  def edit
      @movie = Movie.find(params[:id])
  end

  def create
      @movie = Movie.new(movie_params)
      @movie.user_id = current_user.id

      if @movie.save
          redirect_to @movie
      else
          render 'new'
      end
  end

  def update
      @movie = Movie.find(params[:id])
      respond_to do |format|
          if @movie.update(movie_params) && @movie.img.recreate_versions!
              format.html {redirect_to @movie, notice: 'movie was susseccfully updated.'}
              format.json{ head :no_content }
          else
              format.html {render 'edit'}
              format.json{ render json: @movie.errors, status: :unprocessable_entity }
          end
      end
  end

  def destroy
      @movie = Movie.find(params[:id])
      @movie.destroy

      redirect_to movies_path
  end

  def ensure_correct_user
      @post = Post.find_by(id:params[:id])
      if @post.user_id != @current_user.id
        flash[:notice] = "権限がありません"
        redirect_to movies_path
    end
  end

  private
      def movie_params
          params.require(:movie).permit(:title, :text, :img, :remove_img, :user_id)
      end
end
