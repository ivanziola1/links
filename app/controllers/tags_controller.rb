class TagsController < ApplicationController
  load_and_authorize_resource

  def index
    @tags = Tag.includes(:links).where(user: current_user)
    @links = @tags.find_by(name: params[:tag]).links if params[:tag]
  end
end
