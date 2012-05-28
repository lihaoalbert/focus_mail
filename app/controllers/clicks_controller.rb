class ClicksController < ApplicationController
  def index
    @clicks = Click.includes(:member, :campaign, :link).paginate(:page => params[:page], :per_page => 20)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @clicks }
    end
  end
end
