class HomeController < ApplicationController
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

    amount.to_i.times{ MemberMailer.send_email(from, to, subject, body).deliver }
    #Resque.enqueue(EmailSender, from_name, from_email, subject, to_email, amount, body)
    redirect_to root_path, :notice => "Email is sending"
  end

  def click
    link_id = params[:l]
    member_id = params[:u]
    campaign_id = params[:c]

    link = Link.find(link_id)
    Click.create(member_id: member_id, campaign_id: campaign_id, link_id: link_id)
    redirect_to link.url
  end

end
