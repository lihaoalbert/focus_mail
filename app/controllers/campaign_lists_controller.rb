class CampaignListsController < ApplicationController
  # GET /campaign_lists
  # GET /campaign_lists.json
  def index
    @campaign_lists = CampaignList.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @campaign_lists }
    end
  end

  # GET /campaign_lists/1
  # GET /campaign_lists/1.json
  def show
    @campaign_list = CampaignList.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @campaign_list }
    end
  end

  # GET /campaign_lists/new
  # GET /campaign_lists/new.json
  def new
    @campaign_list = CampaignList.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @campaign_list }
    end
  end

  # GET /campaign_lists/1/edit
  def edit
    @campaign_list = CampaignList.find(params[:id])
  end

  # POST /campaign_lists
  # POST /campaign_lists.json
  def create
    @campaign_list = CampaignList.new(params[:campaign_list])

    respond_to do |format|
      if @campaign_list.save
        format.html { redirect_to @campaign_list, notice: 'Campaign list was successfully created.' }
        format.json { render json: @campaign_list, status: :created, location: @campaign_list }
      else
        format.html { render action: "new" }
        format.json { render json: @campaign_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /campaign_lists/1
  # PUT /campaign_lists/1.json
  def update
    @campaign_list = CampaignList.find(params[:id])

    respond_to do |format|
      if @campaign_list.update_attributes(params[:campaign_list])
        format.html { redirect_to @campaign_list, notice: 'Campaign list was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @campaign_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /campaign_lists/1
  # DELETE /campaign_lists/1.json
  def destroy
    @campaign_list = CampaignList.find(params[:id])
    @campaign_list.destroy

    respond_to do |format|
      format.html { redirect_to campaign_lists_url }
      format.json { head :no_content }
    end
  end
end
