class ScreenplaysController < ApplicationController
  before_action :lookup_screenplay, only: [:show, :edit, :update, :destroy]

  def new
    @screenplay = Screenplay.new
  end

  def show
    if params[:format] == 'pdf'
      filename, pretty_filename = @screenplay.save_to_pdf
      send_file(filename, :type => :pdf, :filename => pretty_filename)
    end
  end

  def index
    @screenplays = Screenplay.all
  end

  def edit
  end

  def create
    @screenplay = Screenplay.new(screenplay_params)

    if @screenplay.save
      redirect_to @screenplay,
        notice: 'Screenplay was successfully created.'
    else
      render :new
    end
  end

  def update
    if @screenplay.update(screenplay_params)
      redirect_to @screenplay,
        notice: 'Screenplay was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @screenplay.destroy
    redirect_to new_screenplay_path,
      notice: 'Screenplay was successfully destroyed.'
  end

  private

  def screenplay_params
    params.require(:screenplay).permit(:fountain, :title)
  end

  def lookup_screenplay
    @screenplay = Screenplay.find(params[:id])
  end
end
