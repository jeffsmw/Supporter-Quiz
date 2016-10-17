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
    @request = Request.order(status: :desc).page params[:page]
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
    @q = params[:q]
    # @request = (Request.where(["name ILIKE ?", "%#{@q}%"]).order("name").page + Request.where(["email ILIKE ?", "%#{@q}%"]).order("email").page + Request.where(["department ILIKE ?", "%#{@q}%"]).order("department").page + Request.where(["message ILIKE ?", "%#{@q}%"]).order("message").page)

    @request = Request.where(["name ILIKE ? OR email ILIKE ? OR department ILIKE ? or message ILIKE ?", "%#{@q}%", "%#{@q}%", "%#{@q}%", "%#{@q}%"]).order(:status, :name).page params[:page]

  end
end
