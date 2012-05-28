class CampaignsController < ApplicationController
  # GET /campaigns
  # GET /campaigns.json
  def index
    @campaigns = Campaign.all
    @campaign = Campaign.new

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @campaigns }
    end
  end

  # GET /campaigns/1
  # GET /campaigns/1.json
  def show
    @campaign = Campaign.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @campaign }
    end
  end

  def new
    @campaign = Campaign.new

    respond_to do |format|
      format.html # new.html.erb
      format.js
    end
  end

  def edit
    @campaign = Campaign.find(params[:id])
  end

  def create
    @campaign = Campaign.new(params[:campaign])

    respond_to do |format|
      if @campaign.save
        format.html { redirect_to @campaign, notice: 'Campaign was successfully created.' }
        format.js
      else
        format.html { render action: "new" }
        format.js { render action: "new" }
      end
    end
  end

  def update
    @campaign = Campaign.find(params[:id])

    respond_to do |format|
      if @campaign.update_attributes(params[:campaign])
        format.html { redirect_to @campaign, notice: 'Campaign was successfully updated.' }
        format.js
      else
        format.html { render action: "edit" }
        format.js { render action: "edit" }
      end
    end
  end

  def destroy
    @campaign = Campaign.find(params[:id])
    @campaign.destroy

    respond_to do |format|
      format.html { redirect_to campaigns_url }
      format.js
    end
  end

  def deliver
    @campaign = Campaign.find(params[:id])
    from_name = @campaign.from_name
    from_email = @campaign.from_email
    from = from_name.present? ? %{"#{from_name}" <#{from_email}>} : from_email
    subject = @campaign.subject
    template_name = @campaign.template.file_name

    @campaign.lists.collect(&:members).flatten.each do |member|
      to_email = member.email
      to_name = member.name
      FocusMailer.send_email_with_template(from, to_email, to_name, member.id, subject, @campaign.id).deliver
    end
  end

  def template_entries
    @template = Template.find(params[:t_id])
    # because sometime @campaign does not exist when it's a new one
    @campaign = Campaign.find_by_id(params[:c_id])
    respond_to do |format|
      format.js
    end
  end
end
