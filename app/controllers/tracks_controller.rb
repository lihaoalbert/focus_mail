class TracksController < ApplicationController
  def index
    @tracks = Track.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tracks }
    end
  end
end
