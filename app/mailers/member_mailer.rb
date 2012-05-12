class MemberMailer < ActionMailer::Base
  include Resque::Mailer

  #default from: "neosoyn@gmail.com"
  default from: "user08@cndemo.openfind.com"

  def test_email
    mail(to: 'neosoyn@gmail.com', subject: 'Email test')
  end

  def send_email(from, to, subject, content)
    mail(from: from, to: to, subject: subject) do |format|
      format.text { render text: content }
      format.html { render text: "#{content}" }
    end
  end

end
