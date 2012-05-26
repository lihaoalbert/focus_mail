class MemberMailer < ActionMailer::Base
  include Resque::Mailer

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

  def send_email_with_template(from, to, subject, template_name)
    #mail(from: from, to: to, subject: subject, template_name: template_name)
    mail(from: from, to: to, subject: subject) do |format|
      source = IO.readlines(Rails.root.join('lib/emails', "#{template_name}.html.erb")).join("").strip
      body = source.gsub(/\$\|NAME\|\$/, to)
      format.text { render text: body}
      format.html { render text: "#{body}" }
    end
  end

end
