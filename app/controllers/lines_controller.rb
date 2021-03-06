class LinesController < ApplicationController
  def index
    @lines = Line.all
    @data = Station.datamaker

  end

  def new
    @line = Line.new
  end

  def create
    @line = Line.new(line_params)
    if @line.save
      @line.station_ids = params[:line][:station_ids]
      flash[:notice] = "Bridge created."
      redirect_to lines_path
    else
      render 'new'
    end
  end

  def show
    @line = Line.find(params[:id])
    @line_data = @line.station_data
  end

  def edit
    @line = Line.find(params[:id])
  end

  def update
    @line = Line.find(params[:id])
    if @line.update(line_params)
      @line.station_ids = params[:line][:station_ids]
      flash[:notice] = "Bridge updated."
      redirect_to line_path(@line)
    else
      render 'edit'
    end
  end

  def destroy
    @line = Line.find(params[:id])
    @line.destroy
    flash[:notice] = "Bridge deleted."
    redirect_to lines_path
  end

  private
  def line_params
    params.require(:line).permit(:name, :station_id)
  end

end

#index, new, create, show, edit, update, and destroy
