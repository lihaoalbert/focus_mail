class FocusMailer < ActionMailer::Base
  include Resque::Mailer
  include ApplicationHelper

  #default from: "neosoyn@gmail.com"
  default from: "user08@cndemo.openfind.com"

  def test_email
    mail(to: 'neosoyn@gmail.com', subject: 'Email test')
  end

  def send_email(from, to, subject, body)
    mail(from: from, to: to, subject: subject) do |format|
      format.text { render text: body}
      format.html { render text: "#{body}" }
    end
  end

  def send_email_with_template(from, to_email, to_name, member_id, subject, campaign_id)
    to = to_name.present? ? %{"#{to_name}" <#{to_email}>} : to_email
    mail(from: from, to: to, subject: subject) do |format|
      source = replace_email_source(campaign_id, member_id)
      source = source.gsub(/\$\|NAME\|\$/, to_name)
      source = source.gsub(/\$\|EMAIL\|\$/, to_email)
      source = source.gsub(/\$\|SUBJECT\|\$/, subject)

      # add track code to monitor email open
      body = "<body>"
      body << source
      body << %Q{<img src="http://#{Rails.configuration.host_with_port}/track.gif?c=#{campaign_id}&u=#{member_id}" style="display:none" />}
      body << "</body>"

      format.text { render text: body}
      format.html { render text: "#{body}" }
    end
  end

end
