class StylesController < ApplicationController

  def new
    @style = Style.new
  end

  def create
    @style = Style.new(style_params)

    if @style.save
      flash[:success] = "Your style was successfully added"
      redirect_to recipes_path
    else
      render :new
    end
  end

  def show

  end

  private

    def style_params
      params.require(:style).permit(:name)
    end

end