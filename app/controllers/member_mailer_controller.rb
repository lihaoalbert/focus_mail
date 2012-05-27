class MemberMailerController < ApplicationController
  layout false
  include ApplicationHelper

  def preview
    campaign = Campaign.find(params[:campaign_id])
    member_id = 0

    source = replace_email_source(campaign.id, member_id)

    # replace receiver name, receiver email, subject

    respond_to do |format|
      format.html { render :text => source }
    end
  end
end
