class ClicksController < ApplicationController
  def index
    @clicks = Click.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @clicks }
    end
  end
end
