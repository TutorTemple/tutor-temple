class PagesController < ApplicationController
  def index
    render params[:page_name]
  end
end
