class HomeController < ApplicationController
  include ApplicationHelper

  def index
  end

  def generate_email

  end

  def send_email
    from_name = params[:from_name]
    from_email = params[:from_email]
    from = from_name.present? ? %{"#{params[:from_name]}" <#{params[:from_email]}>} : params[:from_email]
    subject = params[:subject]
    to_email = params[:to_email]
    to_name = params[:to_name]
    to = to_name.present? ? %{"#{params[:to_name]}" <#{params[:to_email]}>} : params[:to_email]
    body = params[:body]
    amount = params[:amount] || 1

    amount.to_i.times{ FocusMailer.send_email(from, to, subject, body).deliver }
    #Resque.enqueue(EmailSender, from_name, from_email, subject, to_email, amount, body)
    redirect_to root_path, :notice => "Email is sending"
  end

  def click
    link_id = params[:l]
    member_id = params[:u]
    campaign_id = params[:c]
    if link_id && member_id && campaign_id
      link = Link.find(link_id)
      Click.create(member_id: member_id, campaign_id: campaign_id, link_id: link_id)
    end
    redirect_to link.url
  end

  def track
    member_id = params[:u]
    campaign_id = params[:c]
    if member_id && campaign_id
      Track.create(member_id: member_id, campaign_id: campaign_id)
    end
    send_data open(Rails.root.join("app/assets/images", "track.gif"), 'rb').read, :type => 'image/gif', :disposition => 'inline'
  end


  def preview
    campaign = Campaign.find(params[:campaign_id])
    member_id = 0
    source = replace_email_source(campaign.id, member_id)
    respond_to do |format|
      format.html { render :text => source, :layout => false }
    end
  end

end
