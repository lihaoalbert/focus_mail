class CampaignMembersController < ApplicationController
  # GET /campaign_members
  # GET /campaign_members.json
  def index
    @campaign_members = CampaignMember.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @campaign_members }
    end
  end

  # GET /campaign_members/1
  # GET /campaign_members/1.json
  def show
    @campaign_member = CampaignMember.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @campaign_member }
    end
  end

  # GET /campaign_members/new
  # GET /campaign_members/new.json
  def new
    @campaign_member = CampaignMember.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @campaign_member }
    end
  end

  # GET /campaign_members/1/edit
  def edit
    @campaign_member = CampaignMember.find(params[:id])
  end

  # POST /campaign_members
  # POST /campaign_members.json
  def create
    @campaign_member = CampaignMember.new(params[:campaign_member])

    respond_to do |format|
      if @campaign_member.save
        format.html { redirect_to @campaign_member, notice: 'Campaign member was successfully created.' }
        format.json { render json: @campaign_member, status: :created, location: @campaign_member }
      else
        format.html { render action: "new" }
        format.json { render json: @campaign_member.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /campaign_members/1
  # PUT /campaign_members/1.json
  def update
    @campaign_member = CampaignMember.find(params[:id])

    respond_to do |format|
      if @campaign_member.update_attributes(params[:campaign_member])
        format.html { redirect_to @campaign_member, notice: 'Campaign member was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @campaign_member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /campaign_members/1
  # DELETE /campaign_members/1.json
  def destroy
    @campaign_member = CampaignMember.find(params[:id])
    @campaign_member.destroy

    respond_to do |format|
      format.html { redirect_to campaign_members_url }
      format.json { head :no_content }
    end
  end
end
