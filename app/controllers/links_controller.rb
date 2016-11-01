class LinksController < ApplicationController
  load_and_authorize_resource

  def index
    @links = Link.includes(:tags).where(user: current_user)
    @link = Link.new
  end

  def create
    @link = Link.new(link_params)
    @link.user = current_user
    if @link.save
      create_tags @link.labels, @link.id, current_user.id
      redirect_to links_url, notice: 'Link was successfully created.'
    else
      @links = Link.includes(:tags).where(user: current_user)
      render 'index'
    end
  end

  private

  # make background
  def create_tags(_labels, _link_id, _user_id)
    labels = _labels.split(',')
    if labels.any?
      link = Link.find(_link_id)
      labels.each do |label|
        tag = Tag.where(name: label.strip, user_id: _user_id).first_or_initialize
        tag.links << link
        tag.save
        link.tags << tag
        link.save
      end
    end
  end

  def set_link
    @link = Link.find(params[:id])
  end

  def link_params
    params.require(:link).permit(:hyperlink, :description, :labels)
  end
end
