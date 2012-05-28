class TracksController < ApplicationController
  def index
    @tracks = Track.includes(:member, :campaign).paginate(:page => params[:page], :per_page => 20)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tracks }
    end
  end
end
