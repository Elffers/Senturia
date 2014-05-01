class LinksController < AdminController

  def index
    @links = Link.all
    @link = Link.new
  end

  def create
    @link = Link.new(link_params)
    if @link.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def link_params
    params.require(:link).permit(:name, :url, :show)
  end
end
