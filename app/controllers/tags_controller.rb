class TagsController < ApplicationController
  before_action :current_tag, only: [:show, :edit, :update, :destroy]

  def index
    @tags =Tag.all
  end

  def new
     @tag = Tag.new
  end

  def show
  end

  def create
    @tag= Tag.new(tag_params)
   
    if @tag.save
      redirect_to @tag, notice: "New tag created successfully."
      else
        render :new
    end
  end 

  def update
    if @tag.update(tag_params)
      redirect_to tag_path(@tag)
    else
      render :edit
    end
  end

  def edit
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy

    redirect_to tags_path
  end

  private
    def tag_params
      params.require(:tag).permit(:name, :code)
    end 

  def current_tag
    @tag = Tag.find(params[:id])
  end
end
