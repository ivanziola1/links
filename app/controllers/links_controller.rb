class LinksController < ApplicationController
  load_and_authorize_resource
  before_filter :set_links, only: [:index, :create]
  def index
    @link = Link.new
  end

  def create
    @link = Link.new(link_params)
    @link.user = current_user
    @link.tags = init_tags(@link, current_user.id)
    if @link.save
      redirect_to links_url, notice: 'Link was successfully created.'
    else
      render 'index'
    end
  end

  private

  def init_tags(_link, _user_id)
    tags = []
    _link.labels.split(',').each do |tag|
      tags << Tag.where(name: tag.strip, user_id: _user_id).first_or_initialize
    end
    tags
  end

  def set_link
    @link = Link.find(params[:id])
  end

  def set_links
    @links = Link.includes(:tags).where(user: current_user)
  end

  def link_params
    params.require(:link).permit(:hyperlink, :description, :labels)
  end
end
