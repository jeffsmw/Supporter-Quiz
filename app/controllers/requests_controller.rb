class RequestsController < ApplicationController
  def new
    @request = Request.new
  end

  def create
    request_params = params.require(:request).permit([:name, :email, :department, :message])
    @request = Request.new request_params
    if @request.save
      redirect_to requests_path
    else
      render :new
    end
  end

  def show
    redirect_to requests_path
  end

  def index
    @request = Request.order(status: :desc)
  end

  def edit
    @request = Request.find params[:id]
  end

  def update
    @request = Request.find params[:id]
    request_params = params.require(:request).permit([:name, :email, :department, :message])
    if @request.update request_params
      redirect_to requests_path
    else
      #render plain: "Req Not Created!"
      render :edit
    end
  end

  def destroy
    @request = Request.find params[:id]
    @request.destroy
    redirect_to requests_path
  end

  def change
    @request = Request.find params[:id]
    if @request.status == "undone"
      @request.update_attribute :status, "done"
    else
      @request.update_attribute :status, "undone"
    end
    redirect_to requests_path
  end

  def search
  end
end
