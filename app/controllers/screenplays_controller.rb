class ScreenplaysController < ApplicationController
  before_action :lookup_and_protect, only: [:show, :edit, :update, :destroy]

  def new
    @screenplay = Screenplay.new
  end

  def show
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
    params.require(:screenplay).permit(
      :fountain, :title, :author_name, :password)
  end

  def lookup_and_protect
    @screenplay = Screenplay.find(params[:id])
    # request_http_basic_authentication
    # authenticate_with_http_basic do |username, password|
    #   @screenplay.author_name == username && @screenplay.password == password
    # end
  end
end
